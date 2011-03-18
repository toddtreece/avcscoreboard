Ext.define('SparkFun.AVC.TeamMember.List', {
  extend: 'Ext.grid.GridPanel',
  title: 'Members',
  id:'members',
  enableDragDrop: true,
  droppedMember:function(record,team_id){
    record.set('team_id',this.team_id);
    record.save();
    this.store.load();
    Ext.getCmp('allMembers').store.load();
  },
  viewConfig: {
    stripeRows: true,
    plugins: {
      ptype: 'gridviewdd',
      dragGroup: 'allmembersDD',
      dropGroup: 'membersDD'
    },
    listeners: {
      drop: function(node, data) {
        Ext.getCmp('members').droppedMember(data.records[0]);
      }
    } 
  },
  autoScroll: true,
  initComponent: function() {
    Ext.apply(this, {
      enableDragDrop: true,
      store: new Ext.data.Store({
        model: 'team_member',
        remoteFilter: true,
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
    SparkFun.AVC.TeamMember.List.superclass.initComponent.apply(this, arguments);
  }
});

