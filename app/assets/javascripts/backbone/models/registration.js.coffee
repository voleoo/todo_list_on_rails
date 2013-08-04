class TodoListOnRails.Models.Registration extends Backbone.Model
  paramRoot: 'registration'

  defaults:
    email: null
    password: null
    password_confirmation: null

class TodoListOnRails.Collections.RegistrationsCollection extends Backbone.Collection
  model: TodoListOnRails.Models.Registration
  url: '/registrations'
