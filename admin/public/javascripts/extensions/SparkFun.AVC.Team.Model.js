Ext.regModel('team', {
  hasMany: ['team_member', 'bot'],
  fields: [
    {name: 'id', type: 'int'},
    {name: 'name', type: 'string'},
    {name: 'city', type: 'string'},
    {name: 'state', type: 'string'},
    {name: 'country', type: 'string'}
  ],
  proxy: {
    type: 'rest',
    url: '/teams',
    format: 'json',
    reader: {
      type: 'json',
      idProperty: 'id',
      successProperty: 'success',
      root: 'data'
    }
  }
});

