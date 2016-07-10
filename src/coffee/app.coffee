# Uppercase -> constructors
# lowercase -> instances
window.App =
  Collections: {}
  Models: {}
  Views:
    User: {}

  collections: {}
  models: {}
  views:
    user: {}
  templates:
    user: {}

  init: () ->
    App.models.app = new App.Models.App()
    App.collections.users = new App.Collections.Users()

    new App.Router()
    Backbone.history.start()
    $.material.init()
$ ->
  App.init()
