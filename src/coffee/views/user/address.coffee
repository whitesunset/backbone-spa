App.Views.User.Address = Backbone.View.extend
  initialize: () ->
    @template = App.templates.user.address
  render: ->
    t = @
    @$el.html @template(@model.toJSON())
    # finish iframe animation
    @$el.find('iframe').on 'load', ->
      t.$el.find('.iframe-container').removeClass('anim-active')
    @