TodoListOnRails.Views.Users ||= {}

class TodoListOnRails.Views.Users.MenuView extends Backbone.View
  className: 'big-auth-line'
    
  initialize: ->
    @model.url = '/user'
    @model.fetch()
    Backbone.history.navigate('/', {trigger: true})
    @template = HoganTemplates['menu']
    @render()

  events:
    "click .sing-out" : "sing_out"

  sing_out: ->
    @model.destroy()
    Backbone.history.navigate('/login', {trigger: true})

  render: ->
    if @model.id
      @$el.html @template.render(@model.toJSON())    
      $('nav').html @$el
    else
      Backbone.history.navigate('/login', {trigger: true})