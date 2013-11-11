# for more details see: http://emberjs.com/guides/models/defining-models/

Virtualcongress.Mission = DS.Model.extend
  mission_type: DS.attr 'string'
  text: DS.attr 'string'
  url: DS.attr 'string'
  completed: DS.attr 'boolean'

  isAction:(->
    @get('mission_type') == 'check_in'
  ).property('mission_type')

  emberUrl: (->
    "#"+@get('url')
  ).property('url')