# for more details see: http://emberjs.com/guides/models/defining-models/

Virtualcongress.Friend = DS.Model.extend
  name: DS.attr 'string'
  title: DS.attr 'string'
  points: DS.attr 'number'
  level: DS.attr 'number'
  admin: DS.attr 'boolean'
  level_percentage:  DS.attr 'number' 
  goal: DS.attr 'number'
  baseline: DS.attr 'number'
  photo: DS.attr 'string'

Virtualcongress.Player = Virtualcongress.Friend.extend
  missions: (->
    @get('store').find('mission')
  ).property('points')

  activeMissions:( ->
    @get('store').all('mission').filterProperty("completed",false);
  ).property('points',"completedMissions","missions")

  completedMissions:( ->
    @get('store').all('mission').filterProperty("completed",true);
  ).property('points','activeMissions',"missions")

