class TodoListOnRails.Routers.TasksRouter extends Backbone.Router
  initialize: (options) ->
    @tasks = new TodoListOnRails.Collections.TasksCollection()
    @tasks.reset options.tasks

  routes:
    "new"      : "newTasks"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newTasks: ->
    @view = new TodoListOnRails.Views.Tasks.NewView(collection: @tasks)
    $("#tasks").html(@view.render().el)

  index: ->
    @view = new TodoListOnRails.Views.Tasks.IndexView(tasks: @tasks)
    $("#tasks").html(@view.render().el)

  show: (id) ->
    tasks = @tasks.get(id)

    @view = new TodoListOnRails.Views.Tasks.ShowView(model: tasks)
    $("#tasks").html(@view.render().el)

  edit: (id) ->
    tasks = @tasks.get(id)

    @view = new TodoListOnRails.Views.Tasks.EditView(model: tasks)
    $("#tasks").html(@view.render().el)
