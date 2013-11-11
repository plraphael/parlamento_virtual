Virtualcongress.ApplicationController = Ember.ObjectController.extend
  needs: "game"
  currentPathChanged: (->
    window.scrollTo(0, 0);
  ).observes('currentPath')

Virtualcongress.ElectController = Ember.ObjectController.extend
  needs: "game"
  actions:{
    login: ->
      $(".loading").show()
      FB.login (response) => 
        if response.authResponse
          $.post "/auth/facebook/callback", response, (data) => 
            @controllerFor('game').getPlayer()
        else
          console.log "facebook login failed"
          $(".loading").hide()
  }