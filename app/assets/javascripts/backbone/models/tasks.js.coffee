class TodoListOnRails.Models.Tasks extends Backbone.Model
  paramRoot: 'task'

  defaults:
    name: null
    position: null
    done: null
    project_id: null
    displayNone: 'displayNone'
    displayBlock: 'displayBlock'

class TodoListOnRails.Collections.TasksCollection extends Backbone.Collection
  model: TodoListOnRails.Models.Tasks
  url: '/tasks'
