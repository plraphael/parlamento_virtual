# for more details see: http://emberjs.com/guides/models/defining-models/

Virtualcongress.Player = DS.Model.extend
  name: DS.attr 'string'
  title: DS.attr 'string'
  points: DS.attr 'number'
  level: DS.attr 'number'
  admin: DS.attr 'boolean'
  level_percentage:  DS.attr 'number' 
  goal: DS.attr 'number'
  baseline: DS.attr 'number'  

  missions: (->
    @get('store').find('mission')
  ).property('points')
