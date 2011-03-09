Ext.define('SparkFun.AVC.TeamMember.List', {
  extend: 'Ext.grid.GridPanel',
  title:'Members',
  viewConfig: { 
    stripeRows: true
  },
  id:'members',
  autoScroll:true,
  initComponent: function() {
    Ext.apply(this, { 
      store: new Ext.data.Store({
        model:'team_member',
        remoteFilter:true,
        restful:true
      }),
      headers:[{
        dataIndex:'id',
        text:'ID',
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
