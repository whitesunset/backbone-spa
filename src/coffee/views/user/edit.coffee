App.Views.User.Edit = Backbone.View.extend
  el: '#content'
  model: App.models.user
  initialize: (id) ->
    t = @
    @template = App.templates.user.edit
    @model = new App.Models.User
      id: id
    # start loading animation
    @$el.addClass('anim-active')
    @model.fetch()
      .done ->
        t.render()
      .fail ->
        App.views.root.render404()
  events:
    'submit form': 'handleSubmit'
    # bind input fields to model attributes
    'input [type!="submit"]': 'handleInput'
  handleInput: (e) ->
    field = e.target.name
    value = _.escape e.target.value
    @model.set(field, value)
  handleSubmit: (e) ->
    e.preventDefault()
    btn = $(e.target).find('[type="submit"]')
    @model.save()
      .done ->
        #on success save — change submit button state and revert back after 2 seconds
        btn.switchState 'Success', 'btn-success btn-raised'
      .fail ->
        #on fail — change submit button state and revert back after 2 seconds
        btn.switchState 'Fail', 'btn-danger btn-raised'
  render: ->
    # finish loading animation
    @$el.removeClass('anim-active')
    data = @model.toJSON()
    @$el.html @template(data)
    # render Address View as independent commponent, model and el are required
    address_model = new Backbone.DeepModel(data.address)
    address_view = new App.Views.User.Address
      model: address_model
      el: '#address'
    address_view.render()
    @