# for more details see: http://emberjs.com/guides/models/defining-models/

Virtualcongress.Proposal = DS.Model.extend
  description: DS.attr 'string'
  votesInFavor: DS.attr 'number'
  votesAgainst: DS.attr 'number'
  favor: DS.attr 'number'
  law_id: DS.attr 'string'
  author_name: DS.attr 'string'
  author_image: DS.attr 'string'
