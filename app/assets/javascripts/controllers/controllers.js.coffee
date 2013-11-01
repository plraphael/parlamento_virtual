#Virtualcongress.__container__.lookup('store:main').find('mission')
Virtualcongress.ApplicationController = Ember.ObjectController.extend
  needs: "game"

Virtualcongress.ElectController = Ember.ObjectController.extend
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


Virtualcongress.LawController = Ember.ObjectController.extend
  needs: "game"
  actions:{
    voteFor: ->
      @get('model').set('favor',1)
      @get('model').save()
    voteAgainst: ->
      @get('model').set('favor',0)
      @get('model').save()
    define: ->
      @get('model').set('defined',1)
      @get('model').save()
    reset: ->
      @get('model').set('defined',-1)
      @get('model').set('favor',0)      
      @get('model').save()
    propose: ->
      law_id = @get('model').get('id')
      proposal = @get('store').createRecord 'proposal', {
        law_id: law_id,
        description: @get('new_proposal_message')
      }
      proposal.save()
      @get('model').save()
      @set('new_proposal_message',"")
  }

Virtualcongress.GameController = Ember.ObjectController.extend
  isLoggedIn: false

  getPlayer: ->
    if @get('isLoggedIn') == false
      @get('store').find('player').then (players) =>
        player = players.objectAt(0)
        if player
          @set('isLoggedIn', true)
          Stream.setHandler player.id,(e,player_id) =>
            event = $.parseJSON(e.data).event
            pack = $.parseJSON(e.data).message
            
            if event == "messages.player."+player_id
              $("#stream").prepend(".");
              new_player = pack.message.player
              this.get('store').find('player',player_id).then (player) =>
                player.setProperties(new_player)
                this.set('isLoggedIn', true)

            if event == "messages.law"
              $("#stream").prepend("-");
              this.get('store').find('proposal').then () =>
                this.get('store').find('law')

          @controllerFor('game').set('model', player);


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
    logout: ->
      FB.logout()
      $.get "/signout"
      @set('isLoggedIn', false)
    evolve: ->
      @set('advance',@get('advance')+10)
    bar: ->
      @set('showBar',not @get('showBar'))
    missions: ->
      @set('showBar',not @get('showBar'))
    checkin: ->
      console.log "checkin"
  }

Virtualcongress.MenuController = Ember.ObjectController.extend
  menu: [{title: "Voltar", route: "#/"}]
