# for more details see: http://emberjs.com/guides/models/defining-models/

Virtualcongress.Proposal = DS.Model.extend
  description: DS.attr 'string'
  favor: DS.attr 'number'
  votes: DS.attr 'number'
  law_id: DS.attr 'string'
  author_name: DS.attr 'string'
  author_image: DS.attr 'string'
  updated_at: DS.attr 'string'

  isFor: (->
    @get("favor") == 1
  ).property("favor")

  isAgainst: (->
    @get("favor") == -1
  ).property("favor")