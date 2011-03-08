Ext.regModel('lap', {
  belongsTo: ['bot', 'heat'],
  fields: [
    {name: 'id', type: 'int'},
    {name: 'lap_time', type:'string'},
    {name: 'bots_id', type: 'int'},
    {name: 'corners_completed', type: 'string'},
    {name: 'heats_id', type:'int'},
    {name: 'disqualified', type: 'boolean'}
  ],
  proxy: {
    type: 'rest',
    url: '/laps.json',
    reader: {
      type: 'json',
      root: 'data'
    }
  }
});

