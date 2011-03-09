Ext.regModel('team_member', {
  belongsTo: 'team',
  fields: [
    {name: 'id', type: 'int'},
    {name: 'firstname', type: 'string'},
    {name: 'lastname', type: 'string'},
    {name: 'teams_id', type: 'int'}
  ],
  proxy: {
    type: 'rest',
    url: '/team_members',
    format:'json',
    reader: {
      type: 'json',
      root: 'data'
    }
  }
});

