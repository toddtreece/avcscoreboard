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
          region: 'center',
          border: false
        }),
        new SparkFun.AVC.TeamMember.List({
          region: 'south',
          height:'50%',
          hidden:true,
          split:true
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

