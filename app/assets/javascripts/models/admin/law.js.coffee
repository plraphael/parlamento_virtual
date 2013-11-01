# for more details see: http://emberjs.com/guides/models/defining-models/

Virtualcongress.AdminLaw = DS.Model.extend
  title: DS.attr 'string'
  type: DS.attr 'string'
  excerpt: DS.attr 'string'
  description: DS.attr 'string'
  state: DS.attr 'string'
  realLaw: DS.belongsTo 'Virtualcongress.RealLaw'
