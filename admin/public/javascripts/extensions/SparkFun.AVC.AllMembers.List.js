Ext.define('SparkFun.AVC.AllMembers.List', {
  extend: 'Ext.grid.GridPanel',
  title: 'All Competitors',
  id:'allMembers',
  enableDragDrop: true,
  droppedMember:function(record){
    record.set('team_id',0);
    record.save();
    this.store.load();
  },
  tbar: [{
    text: 'New Competitor',
    xtype: 'button',
    iconCls:'add-icon',
    handler: function() {
      win = Ext.widget('window', {
        title: 'New Competitor',
        closeAction: 'hide',
        bodyPadding: 10,
        width: 400,
        height:200,
        layout: 'fit',
        modal: true,
        items: [new SparkFun.AVC.TeamMember.Form()]
      });
      win.show();
    }
  }],
  viewConfig: {
    stripeRows: true,
    plugins: {
      ptype: 'gridviewdd',
      dragGroup: 'membersDD',
      dropGroup: 'allmembersDD'
    },
    listeners: {
      drop: function(node, data) {
        Ext.getCmp('allMembers').droppedMember(data.records[0]);
      }
    }
  },
  autoScroll: true,
  initComponent: function() {
    Ext.apply(this, {
      enableDragDrop: true,
      store: new Ext.data.Store({
        autoLoad:true,
        model: 'team_member',
        restful: true
      }),
      headers: [{
        dataIndex: 'id',
        text: 'ID',
        id: 'id',
        sortable: true,
        flex: 0.5
      },
      {
        dataIndex: 'firstname',
        text: 'Name',
        renderer: function(val, meta, rec) {
          return val + ' ' + rec.data.lastname;
        },
        sortable: true,
        flex: 2
      }]
    });
    SparkFun.AVC.AllMembers.List.superclass.initComponent.apply(this, arguments);
  }
});

