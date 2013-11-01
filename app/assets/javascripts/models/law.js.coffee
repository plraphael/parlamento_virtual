# for more details see: http://emberjs.com/guides/models/defining-models/

Virtualcongress.Law = DS.Model.extend
  title: DS.attr 'string'
  excerpt: DS.attr 'string'
  description: DS.attr 'string'
  state: DS.attr 'string'
  votesFor: DS.attr 'number'
  votesAgainst: DS.attr 'number'
  defined: DS.attr 'number'
  favor: DS.attr 'number'
  updated: DS.attr 'number'

  isFor: (->
    @get('favor') == 1
  ).property('favor')

  isAgainst: (->
    @get('favor') == 0
  ).property('favor')

  isDefined: (->
    @get('defined') == 1
  ).property('defined')  

  canDefine: (->
    @get('favor') != -1
  ).property('favor')  

  thisVote: (->
    return "Y" if @get('isFor')
    return "N" if @get('isAgainst')
    "0"
  ).property('favor')

  thisDefined: (->
    return "D" if @get('defined') == 1
    "" 
  ).property('defined')

  proposals: (->
    @get('store').all('proposal').filterProperty("law_id",@get('id'))
  ).property('updated')
