# Move the path into an HTML data attribute
@Stream =
  source: false
  defaultTime: 30000
  isActive: true

  setHandler: (player_id,onmessage) ->
    if @source == false
      @source = new EventSource("http://localhost:9494/api/v1/messenger/connect?target="+player_id);

    @source.addEventListener "message", (e) ->
      Semaphor.blue()
      onmessage(e,player_id)
      setInterval(Semaphor.green,2000)
    Semaphor.green()

  setPolling: (interval,callback) ->
    if @isActive
      Semaphor.green()
      callback(interval,callback)
    else
      Semaphor.yellow()

  longPollingHello: (interval, repeat)->
    console.log("Bom dia")
    setInterval(repeat,interval)

@Semaphor = 
  red: ->
    $("#semaphor").removeClass("sgreen")
    $("#semaphor").removeClass("syellow")
    $("#semaphor").removeClass("sred")
    $("#semaphor").removeClass("sblue")

    $("#semaphor").addClass("sred")


  green: ->
    $("#semaphor").removeClass("sgreen")
    $("#semaphor").removeClass("syellow")
    $("#semaphor").removeClass("sred")
    $("#semaphor").removeClass("sblue")

    $("#semaphor").addClass("sgreen")

  blue: ->
    $("#semaphor").removeClass("sgreen")
    $("#semaphor").removeClass("syellow")
    $("#semaphor").removeClass("sred")
    $("#semaphor").removeClass("sblue")

    $("#semaphor").addClass("sblue")

  yellow: ->
    $("#semaphor").removeClass("sgreen")
    $("#semaphor").removeClass("syellow")
    $("#semaphor").removeClass("sred")
    $("#semaphor").removeClass("sblue")

    $("#semaphor").addClass("syellow")