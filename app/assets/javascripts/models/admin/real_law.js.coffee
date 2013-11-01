# for more details see: http://emberjs.com/guides/models/defining-models/

Virtualcongress.AdminRealLaw = DS.Model.extend
  realId: DS.attr 'number'
  name: DS.attr 'string'
  type: DS.attr 'string'
  number: DS.attr 'number'
  year: DS.attr 'number'
  propositionDate: DS.attr 'string'
  excerpt: DS.attr 'string'
  description: DS.attr 'string'
  regime: DS.attr 'string'
  appraisal: DS.attr 'string'
  state: DS.attr 'string'
