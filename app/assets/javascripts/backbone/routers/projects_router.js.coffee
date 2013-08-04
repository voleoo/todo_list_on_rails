class TodoListOnRails.Routers.ProjectsRouter extends Backbone.Router
  initialize: () ->
    @projects = new TodoListOnRails.Collections.ProjectsCollection()

  routes:
    "login"           : "login"
    "registration"    : "registration"
    ".*"              : "index"

  index: ->
    @view = new TodoListOnRails.Views.Projects.ProjectView projects: @projects

  login: ->
    @view = new TodoListOnRails.Views.Logins.LoginView
    @view.render()
  registration: ->
    @view = new TodoListOnRails.Views.Registrations.RegistrationView
    @view.render()
