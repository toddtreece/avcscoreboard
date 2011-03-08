Ext.regModel('heat', {
  hasMany: 'lap',
  belongsTo: 'bot_type',
  fields: [
    {name: 'id', type: 'int'},
    {name: 'starttime', type:'date' },
    {name: 'bot_types_id', type: 'int'}
  ],
  proxy: {
    type: 'rest',
    url: '/heats.json',
    reader: {
      type: 'json',
      root: 'data'
    }
  }
});

