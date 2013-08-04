TodoListOnRails.Views.Registrations ||= {}

class TodoListOnRails.Views.Registrations.ShowView extends Backbone.View
  template: JST["backbone/templates/registrations/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
