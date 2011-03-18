Ext.define('SparkFun.AVC.Dashboard', {
  extend: 'Ext.Viewport',
  title: 'AVC 2011 Admin',
  initComponent: function() {
    Ext.apply(this, {
      layout: 'border',
      items: [{
        layout:'border',
        region:'west',
        width: '40%',
        split:true,
        items: [
        new SparkFun.AVC.Team.List({
          region: 'north',
          border: false,
          height: '33%'
          
        }),
        new SparkFun.AVC.TeamMember.List({
          region: 'center',
          height:'33%',
          hidden:true,
          split:true
        }),
        new SparkFun.AVC.AllMembers.List({
          region: 'south',
          height:'33%'
        })
        ]
      },
      {
        region:'center',
        html:'Blah'
      }]
    });
    SparkFun.AVC.Dashboard.superclass.initComponent.apply(this, arguments);
  }
});

