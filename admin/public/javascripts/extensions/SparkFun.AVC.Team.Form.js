Ext.define('SparkFun.AVC.Team.Form', {
  extend: 'Ext.form.FormPanel',
  defaultType: 'textfield',
  border: false,
  defaults: {
    anchor: '100%'
  },
  items: [{
    fieldLabel: 'Name',
    name: 'name',
    allowBlank: false
  },
  {
    fieldLabel: 'City',
    name: 'city',
    allowBlank: false
  },
  {
    fieldLabel: 'State',
    name: 'state',
    allowBlank: false
  },
  {
    fieldLabel: 'Country',
    name: 'country',
    allowBlank: false
  }],
  initComponent: function() {
    Ext.apply(this, {
      buttons: [{
        text: 'Create',
        handler: function() {
          if (this.up('form').getForm().isValid()) {
            this.up('form').getForm().submit({
              url: 'teams.json',
              success: function () {
                Ext.getCmp('teams').store.load();
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

