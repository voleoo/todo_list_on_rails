class TodoListOnRails.Routers.RegistrationsRouter extends Backbone.Router
  initialize: (options) ->
    @registrations = new TodoListOnRails.Collections.RegistrationsCollection()
    @registrations.reset options.registrations

  routes:
    "new"      : "newRegistration"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newRegistration: ->
    @view = new TodoListOnRails.Views.Registrations.NewView(collection: @registrations)
    $("#registrations").html(@view.render().el)

  index: ->
    @view = new TodoListOnRails.Views.Registrations.IndexView(registrations: @registrations)
    $("#registrations").html(@view.render().el)

  show: (id) ->
    registration = @registrations.get(id)

    @view = new TodoListOnRails.Views.Registrations.ShowView(model: registration)
    $("#registrations").html(@view.render().el)

  edit: (id) ->
    registration = @registrations.get(id)

    @view = new TodoListOnRails.Views.Registrations.EditView(model: registration)
    $("#registrations").html(@view.render().el)
