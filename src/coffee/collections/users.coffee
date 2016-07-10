App.Collections.Users = Backbone.PageableCollection.extend
  url: 'http://jsonplaceholder.typicode.com/users/'
  model: App.Models.User
  mode: 'client'
  # Initial pagination states
  state:
    pageSize: 5
    sortKey: "id"
    order: 0