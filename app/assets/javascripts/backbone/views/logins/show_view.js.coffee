TodoListOnRails.Views.Logins ||= {}

class TodoListOnRails.Views.Logins.ShowView extends Backbone.View
  template: JST["backbone/templates/logins/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
