TodoListOnRails.Views.Registrations ||= {}

class TodoListOnRails.Views.Registrations.RegistrationView extends Backbone.View
  initialize: ->
    @template = HoganTemplates['registration']

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
