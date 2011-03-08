Ext.define('SparkFun.AVC.Dashboard', {
  extend: 'Ext.Viewport',
  title: 'AVC 2011 Admin',
  initComponent: function() {
    Ext.apply(this, {
      layout: 'border',
      items: [
      new SparkFun.AVC.Team.List({
        region: 'center'
      })]
    });
    SparkFun.AVC.Dashboard.superclass.initComponent.apply(this, arguments);
  }
});

