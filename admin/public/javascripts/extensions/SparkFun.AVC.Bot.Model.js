Ext.regModel('bot', {
  belongsTo: ['team', 'bot_type'],
  hasMany: 'lap',
  fields: [
    {name: 'id', type: 'int'},
    {name: 'name', type: 'string'},
    {name: 'bot_types_id', type: 'int'},
    {name: 'teams_id', type: 'int'}
  ],
  proxy: {
    type: 'rest',
    url: '/bots',
    format:'json',
    reader: {
      type: 'json',
      root: 'data'
    }
  }
});

