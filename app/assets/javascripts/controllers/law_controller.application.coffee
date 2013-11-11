Virtualcongress.LawController = Ember.ObjectController.extend
  needs: "game"
  actions:{
    voteFor: ->
      @get('model').set('favor',1)
      @get('model').save().then () =>
        @controllerFor('game').pollFunction()
    voteAgainst: ->
      @get('model').set('favor',0)
      @get('model').save().then () =>
        @controllerFor('game').pollFunction()
    voteProposalFor: (id) ->
      @get('store').find('proposal',id).then (proposal) =>
        if proposal.get('favor') == 1
          proposal.set('favor',0)
        else
          proposal.set('favor',1)
        proposal.save().then =>  
          @controllerFor('game').pollFunction()
    voteProposalAgainst: (id) ->
      @get('store').find('proposal',id).then (proposal) =>
        if proposal.get('favor') == -1
          proposal.set('favor',0)
        else
          proposal.set('favor',-1)
        proposal.save().then =>  
          @controllerFor('game').pollFunction()
    define: ->
      @get('model').set('defined',1)
      @get('model').save().then () =>
        @controllerFor('game').pollFunction()
    reset: ->
      @get('model').set('defined',-1)
      @get('model').set('favor',0)      
      @get('model').save().then () =>
        @controllerFor('game').pollFunction()
    propose: ->
      law_id = @get('model').get('id')
      proposal = @get('store').createRecord 'proposal', {
        law_id: law_id,
        description: @get('new_proposal_message')
      }
      proposal.save()
      @get('model').save().then =>
        @set('new_proposal_message',"")
        @controllerFor('game').pollFunction()
  }

