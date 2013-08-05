TodoListOnRails.Views.Registrations ||= {}

class TodoListOnRails.Views.Registrations.RegistrationView extends Backbone.View
  initialize: ->
    @model = new TodoListOnRails.Models.Registration()
    @template = HoganTemplates['registration']
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
      password_confirmation: $('input.password_confirmation').val()
    @model.save()

  render: ()->
    @$el.html @template.render()    
    $('nav').html @$el
    return @
