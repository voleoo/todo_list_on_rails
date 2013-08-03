class TodoListOnRails.Models.Project extends Backbone.Model
  paramRoot: 'project'

  defaults:
    name: null
    deadline: null
    displayNone: 'displayNone'
    displayBlock: 'displayBlock'


class TodoListOnRails.Collections.ProjectsCollection extends Backbone.Collection
  model: TodoListOnRails.Models.Project
  url: '/projects'
