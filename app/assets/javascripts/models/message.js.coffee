# for more details see: http://emberjs.com/guides/models/defining-models/

Virtualcongress.Message = DS.Model.extend
  content: DS.attr 'string'
  type: DS.attr 'string'
  action: DS.attr 'string'
