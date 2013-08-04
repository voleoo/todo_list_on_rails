class TodoListOnRails.Models.Login extends Backbone.Model
  paramRoot: 'login'

  defaults:
    email: null
    password: null

class TodoListOnRails.Collections.LoginsCollection extends Backbone.Collection
  model: TodoListOnRails.Models.Login
  url: '/logins'
