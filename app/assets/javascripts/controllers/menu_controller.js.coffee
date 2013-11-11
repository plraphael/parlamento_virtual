Virtualcongress.MenuController = Ember.ObjectController.extend
  needs: "game", "elect"
  menu: [{title: "Leis", route: "#/"},{title: "Parlamentares", route: "#/friends"},{title: "Api", route: "#/api"}]
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