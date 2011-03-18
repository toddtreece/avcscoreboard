Ext.define('SparkFun.AVC.Team.List', {
  extend: 'Ext.grid.GridPanel',
  title: 'Teams',
  viewConfig: {
    stripeRows: true
  },
  autoScroll: true,
  onRowSelect: function(model, record, rownumber) {
    var mem = Ext.getCmp('members');
    mem.team_id = record.data.id;
    var store = mem.store;
    store.clearFilter();
    store.filter('team_id',record.data.id);
    mem.show();
  },
  initComponent: function() {
    Ext.apply(this, {
      store: new Ext.data.Store({
        model: 'team',
        restful: true,
        id: 'team',
        autoLoad: true
      }),
      headers: [{
        dataIndex: 'id',
        text: 'ID',
        id: 'id',
        sortable: true,
        flex: 1
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
        hidden: true,
        flex: 1
      },
      {
        dataIndex: 'country',
        text: 'Country',
        hidden: true,
        flex: 1
      }],
      selModel: new Ext.grid.RowSelectionModel({
        listeners: {
          select: {
            element: 'el',
            fn: this.onRowSelect
          }
        }
      }),
    });
    SparkFun.AVC.Team.List.superclass.initComponent.apply(this, arguments);
  }
});

