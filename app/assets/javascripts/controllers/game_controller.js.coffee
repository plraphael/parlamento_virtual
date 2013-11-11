Virtualcongress.GameController = Ember.ObjectController.extend
  isLoggedIn: false
  pollFunction: false
  showBar: false

  setup: ->
    @set("pollFunction", (interval,repeat) =>
      Semaphor.blue()
      @get('store').find('player').then =>
        @get('store').find('law').then =>
          @get('store').find('mission')
      if $("#stream").html()
        $("#stream").html(parseInt($("#stream").html())+1);
      setInterval(repeat,interval) if repeat
      setInterval(Semaphor.green,2000) if repeat
    )

    # Missions start empty
    @get('store').find('mission')
    
    Stream.setPolling Stream.defaultTime, @get('pollFunction')
    $(document).on "click", "#stream", =>
      @controllerFor('game').pollFunction()


  getPlayer: ->
    if @get('isLoggedIn') == false
      @get('store').find('player').then (players) =>
        player = players.objectAt(0)
        if player
          @set('isLoggedIn', true)
          @setup()
          @controllerFor('game').set('model', player);

  getPlayerSSE: ->
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
    check_in: ->
      $.get "api/v1/players/checkin", (data) =>
        console.log "checkin"
        @controllerFor('game').pollFunction()
  }