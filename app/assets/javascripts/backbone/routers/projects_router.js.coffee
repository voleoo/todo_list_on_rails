class TodoListOnRails.Routers.ProjectsRouter extends Backbone.Router
  initialize: () ->
    @projects = new TodoListOnRails.Collections.ProjectsCollection()
    @user = new TodoListOnRails.Models.User()
    
  routes:
    "login"           : "login"
    "registration"    : "registration"
    ".*"              : "index"

  index: ->
    new TodoListOnRails.Views.Users.MenuView model: @user
    new TodoListOnRails.Views.Projects.ProjectView projects: @projects

  login: ->
    new TodoListOnRails.Views.Users.LoginView model: @user

  registration: ->
    new TodoListOnRails.Views.Users.RegistrationView model: @user
