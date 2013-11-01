# Move the path into an HTML data attribute

@Semaphor = 
  red: ->
    $("#semaphor").removeClass("sgreen")
    $("#semaphor").removeClass("syellow")
    $("#semaphor").removeClass("sred")

    $("#semaphor").addClass("sred")

  green: ->
    $("#semaphor").removeClass("sgreen")
    $("#semaphor").removeClass("syellow")
    $("#semaphor").removeClass("sred")

    $("#semaphor").addClass("sgreen")

  blue: ->
    $("#semaphor").removeClass("sgreen")
    $("#semaphor").removeClass("syellow")
    $("#semaphor").removeClass("sred")

    $("#semaphor").addClass("syellow")

@Stream =
  source: false,
  setHandler: (player_id,onmessage) ->
    if @source == false
      @source = new EventSource("http://parlamentovirtual.org/api/v1/messenger/connect?target="+player_id);

    @source.addEventListener "message", (e) ->
      Semaphor.blue()
      onmessage(e,player_id)
      setInterval(Semaphor.green,2000)
    Semaphor.green()