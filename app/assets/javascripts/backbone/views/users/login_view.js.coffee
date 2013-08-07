TodoListOnRails.Views.Users ||= {}

class TodoListOnRails.Views.Users.LoginView extends Backbone.View
  initialize: ->
    @model.url = '/user'
    @model.fetch()
    @template = HoganTemplates['login']

    @model.bind "reset", @is_user, this
    @model.bind "change", @is_user, this

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

  is_user: ->
    if @model.id
      new TodoListOnRails.Views.Users.MenuView model: @model 

  render: ->
      $('nav').html @$el.html @template.render()
