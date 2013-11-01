# for more details see: http://emberjs.com/guides/views/

# Virtualcongress.LawView = Ember.View.extend
#   templateName: 'law'

# Virtualcongress.VoteCounter = Ember.View.extend
#   classNames: ['counter']
#   templateName: 'voteCounter'

Virtualcongress.ProgressBar = Ember.View.extend
  classNames: ['gamebar']
  templateName: 'progressBar'

  goalDidChange: (->
    @$('.progress-bar').attr 'aria-valuemax', (@get('goal') - @get('baseline'))
    @$('.progress-bar').progressbar()
  ).observes('goal')

  pointsDidChange: (->
    console.log @get('points')
    console.log @get('baseline')
    @$('.progress-bar').attr 'aria-valuetransitiongoal', (@get('points') - @get('baseline'))
    @$('.progress-bar').progressbar()
  ).observes('points')
  
  didInsertElement: ->
    @$('.progress-bar').attr 'aria-valuemax', (@get('goal') - @get('baseline'))
    @$('.progress-bar').attr 'aria-valuetransitiongoal', (@get('points') - @get('baseline'))
    @$('.progress-bar').progressbar
      display_text: "center"
      use_percentage: false
    


