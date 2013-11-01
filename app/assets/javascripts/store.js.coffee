# http://emberjs.com/guides/models/defining-a-store/
Virtualcongress.Store = DS.Store.extend
  revision: 14
  adapter: DS.RESTAdapter.create()

Virtualcongress.ApplicationAdapter = DS.RESTAdapter.extend
  namespace: 'api/v1'

