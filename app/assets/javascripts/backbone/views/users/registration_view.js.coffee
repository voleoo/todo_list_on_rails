TodoListOnRails.Views.Users ||= {}

class TodoListOnRails.Views.Users.RegistrationView extends Backbone.View
  className: 'big-auth-line'

  initialize: ->
    @model.url = '/users'

    @template = HoganTemplates['registration']
    @model.bind "reset", @is_user, this
    @model.bind "change", @is_user, this
    @render()

  events:
    "click .sing-in" : "sing_in"
    "click .sing-up" : "sing_up"

  sing_in: ->
    Backbone.history.navigate('/login', {trigger: true})

  sing_up: ->
    @model.set
      email: $('input.email').val()
      password: $('input.password').val()
      password_confirmation: $('input.password-confirmation').val()
    @model.save()

  is_user: ->
    if @model.id
      new TodoListOnRails.Views.Users.MenuView model: @model 

  render: ()->
    @$el.html @template.render()    
    $('nav').html @$el
    return @