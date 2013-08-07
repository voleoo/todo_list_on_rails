#= require_self
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.TodoListOnRails =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: -> 
    new TodoListOnRails.Routers.ProjectsRouter()
    Backbone.history.start()

$(document).ready ->
  TodoListOnRails.init()