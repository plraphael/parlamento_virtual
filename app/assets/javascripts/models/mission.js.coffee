# for more details see: http://emberjs.com/guides/models/defining-models/

Virtualcongress.Mission = DS.Model.extend
  mission_type: DS.attr 'string'
  text: DS.attr 'string'
  url: DS.attr 'string'
  completed: DS.attr 'boolean'

  emberUrl: (->
    "#"+@get('url')
  ).property('url')