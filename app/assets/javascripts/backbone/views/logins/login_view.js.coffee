TodoListOnRails.Views.Logins ||= {}

class TodoListOnRails.Views.Logins.LoginView extends Backbone.View
  initialize: ->
    @model = new TodoListOnRails.Models.Login()
    @template = HoganTemplates['login']
    @render()

  events:
    "click .sing-in" : "sing_in"
    "click .sing-up" : "sing_up"

  sing_in: ->
    @model.set
      email: $('input.email').val()
      password: $('input.password').val()
    @model.save()

  sing_up: ->
    Backbone.history.navigate('/registration', {trigger: true});

  render: ->
    @$el.html @template.render()    
    $('nav').html @$el
    @
