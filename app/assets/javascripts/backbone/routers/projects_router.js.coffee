 class TodoListOnRails.Routers.ProjectsRouter extends Backbone.Router
  initialize: () ->
    @projects = new TodoListOnRails.Collections.ProjectsCollection()
    #@projects.fetch()

  routes:
    ".*"        : "index"

  index: ->
    @view = new TodoListOnRails.Views.Projects.ProjectView projects: @projects
      #tasks: @tasks
    #$("body").html(@view.render().el)
