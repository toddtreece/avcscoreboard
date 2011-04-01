Ext.define('SparkFun.AVC.Team.List', {
  id: 'teams',
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
    store.filters.removeAt(0);
    store.filter('team_id', record.data.id);
    mem.show();
    Ext.getCmp('teams').doLayout();
    Ext.getCmp('allMembers').doLayout();
  },
  tbar: [{
    text: 'New Team',
    xtype: 'button',
    iconCls: 'add-icon',
    handler: function() {
      win = Ext.widget('window', {
        title: 'New Team',
        closeAction: 'hide',
        bodyPadding: 10,
        width: 400,
        height: 200,
        layout: 'fit',
        modal: true,
        items: [new SparkFun.AVC.Team.Form()]
      });
      win.show();
    }
  },
  {
    text: 'Delete Team',
    xtype: 'button',
    iconCls: 'delete-icon',
    handler: function() {
      if (Ext.getCmp('teams').down("dataview").getSelectionCount() > 0) {
        for (team in Ext.getCmp('teams').down("dataview").getSelectedRecords()) {
          Ext.Ajax.request({
            url: 'teams/' + team.id + '.json',
            method:'DELETE'
          });
        }
      }
    }
  }],
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

