App.Router = Backbone.Router.extend
  routes:
    '': 'index',
    '#': 'index',
    'user/:id': 'user',
    '*notFound': 'notFound'

  initialize: () ->
    App.views.root = new App.Views.Root

  user: (id) ->
    App.views.root.render()
    App.models.app.set('page.title', 'Edit User')
    App.views.user.edit = new App.Views.User.Edit(+id)

  index: () ->
    App.views.root.render()
    App.models.app.set('page.title', '')
    App.views.user.list = new App.Views.User.List()

  notFound: () ->
    App.views.root.render404()