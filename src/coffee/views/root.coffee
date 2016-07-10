App.Views.Root = Backbone.View.extend
  el: '#root'
  initialize: ->
    @template = App.templates.root
    @model = App.models.app
    # Update page title on new route visit
    @listenTo(@model, 'change', @renderHeader)
  render: ->
    @$el.html @template(@model.toJSON())
    @$el.find('#content').removeClass('error404')
    @
  renderHeader: ->
    title = @model.toJSON().page.title
    $el = @$el.find('#page_title');
    $el.html  ''
    if title.length > 0
      $el.html '<i>/</i>' + title
  render404: ->
    @$el.find('#content').html('').removeClass('anim-active').addClass('error404')