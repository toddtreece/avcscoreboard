Ext.regModel('bot_type', {
  hasMany: 'bot',
  fields: [
    {name: 'id', type: 'int'},
    {name: 'name', type: 'string'}
  ],
  proxy: {
    type: 'rest',
    url: '/bot_types',
    format:'json',
    reader: {
      type: 'json',
      root: 'data'
    }
  }
});

