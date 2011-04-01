Ext.define('SparkFun.AVC.TeamMember.Form', {
  extend: 'Ext.form.FormPanel',
  defaultType: 'textfield',
  border: false,
  defaults: {
    anchor: '100%'
  },
  items: [{
    fieldLabel: 'First Name',
    name: 'firstname',
    allowBlank: false
  },
  {
    fieldLabel: 'Last Name',
    name: 'lastname',
    allowBlank: false
  }],
  initComponent: function() {
    Ext.apply(this, {
      buttons: [{
        text: 'Create',
        handler: function() {
          if (this.up('form').getForm().isValid()) {
            this.up('form').getForm().submit({
              url: 'team_members.json',
              success: function () {
                Ext.getCmp('allMembers').store.load();
              }
            });
            this.up('window').hide();
          }
        }
      },
      {
        text: 'Cancel',
        handler: function() {
          this.up('form').getForm().reset();
          this.up('window').hide();
        }
      }]
    });
    SparkFun.AVC.Team.Form.superclass.initComponent.apply(this, arguments);
  }
});

