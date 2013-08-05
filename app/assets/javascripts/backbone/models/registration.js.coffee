class TodoListOnRails.Models.Registration extends Backbone.Model
  paramRoot: 'user'

  defaults:
    email: null
    password: null
    password_confirmation: null

  url: '/users'
