class TodoListOnRails.Routers.ProjectsRouter extends Backbone.Router
  initialize: () ->
    @projects = new TodoListOnRails.Collections.ProjectsCollection()
    
  routes:
    "login"           : "login"
    "registration"    : "registration"
    ".*"              : "index"

  index: ->
    new TodoListOnRails.Views.Projects.ProjectView projects: @projects

  login: ->
    new TodoListOnRails.Views.Logins.LoginView

  registration: ->
    new TodoListOnRails.Views.Registrations.RegistrationView()
