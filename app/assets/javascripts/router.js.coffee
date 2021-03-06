# For more information see: http://emberjs.com/guides/routing/

Virtualcongress.Router.map ()->
  @route 'game', {path: "/game"}
  @route 'friends', {path: "/friends"}
  @route 'api', {path: "/api"}  
  @resource 'laws', {path: "/"}
  @resource 'law', {path: "/law/:law_id"}


Virtualcongress.WithUserRoute = Ember.Route.extend
  beforeModel: ->
    @controllerFor('game').getPlayer()

Virtualcongress.FriendsRoute = Virtualcongress.WithUserRoute.extend
  model: -> 
    @get('store').find('friend')


Virtualcongress.LawsRoute = Virtualcongress.WithUserRoute.extend
  model: -> 
    @get('store').find('law')

Virtualcongress.LawRoute = Virtualcongress.WithUserRoute.extend
  model: (params) ->
    @get('store').all('proposal')
    @get('store').find('law',params.law_id)

Virtualcongress.GameRoute = Virtualcongress.WithUserRoute.extend()

Virtualcongress.IndexRoute = Virtualcongress.WithUserRoute.extend()