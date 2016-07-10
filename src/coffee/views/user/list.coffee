App.Views.User.List = () ->
  grid = new Backgrid.Grid
    className: 'table table-striped table-hover'
    columns: [
        {
          name: 'id'
          label: 'ID'
          cell: Backgrid.IntegerCell.extend
            orderSeparator: ''
        }
        {
          name: 'name'
          label: 'Name'
          # custom cell output to link user name with user edit page
          cell: Backgrid.Cell.extend
            render: () ->
              $el = @$el;
              $el.empty();
              model = this.model;
              columnName = this.column.get("name");
              $el.append('<a href="#user/' + model.get('id') + '">' + this.formatter.fromRaw(model.get(columnName), model) + '</a>');
              $el.addClass(columnName);
              @updateStateClassesMaybe();
              @delegateEvents();
              @
          sortable: true
          editable: false
        }
        {
          name: 'email'
          label: 'Email'
          cell: "email"
          sortable: true
          editable: false
        }
        {
          name: 'address.city'
          label: 'City'
          cell: "string"
          sortable: true
          editable: false
        }
      ]
    collection: App.collections.users

  paginator = new Backgrid.Extension.Paginator
    collection: App.collections.users

  # fetch collection and render on success
  App.collections.users.fetch reset: true
    .done ->
      $('#content').html(grid.render().$el)
      $('#content').append(paginator.render().$el)
      $('#content').removeClass('anim-active')
    .fail ->
      App.views.root.render404()