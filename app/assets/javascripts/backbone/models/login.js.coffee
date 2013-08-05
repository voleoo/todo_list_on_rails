class TodoListOnRails.Models.Login extends Backbone.Model
  paramRoot: 'user'

  defaults:
    email: null
    password: null

  url: '/user'
