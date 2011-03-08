Ext.define('SparkFun.AVC.Team.List', {
  extend: 'Ext.grid.GridPanel',
  title:'Teams',
  viewConfig: { 
    stripeRows: true
  },
  autoScroll:true,
  initComponent: function() {
    Ext.apply(this, { 
      store: new Ext.data.Store({
        model:'team',
        restful:true,
        id:'team',
        autoLoad:true
      }),
      headers:[{
        dataIndex:'id',
        text:'ID',
        id: 'id',
        sortable: true,
        flex: 0.5
      },
      {
        dataIndex: 'name',
        text: 'Name',
        sortable: true,
        flex: 2
      },
      {
        dataIndex: 'city',
        text: 'City',
        flex: 1
      },
      {
        dataIndex: 'state',
        text: 'State',
        flex: 1
      },
      {
        dataIndex: 'country',
        text: 'Country',
        flex: 1
      }]
    });
    SparkFun.AVC.Team.List.superclass.initComponent.apply(this, arguments);
  }
});
