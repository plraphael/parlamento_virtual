Ember.Handlebars.helper 'format-date', (date) ->
  moment(date).fromNow()

window.showdown = new Showdown.converter
Ember.Handlebars.helper 'format-markdown', (input) -> 
  new Handlebars.SafeString(window.showdown.makeHtml(input))
