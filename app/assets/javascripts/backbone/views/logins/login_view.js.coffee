TodoListOnRails.Views.Logins ||= {}

class TodoListOnRails.Views.Logins.LoginView extends Backbone.View
  initialize: ->
    @template = HoganTemplates['login']


  events:
    "click .destroy" : "destroy"

  tagName: "nav"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $('nav').html @$el.html @template.render()
    return this


    
