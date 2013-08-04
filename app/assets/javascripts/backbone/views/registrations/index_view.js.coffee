TodoListOnRails.Views.Registrations ||= {}

class TodoListOnRails.Views.Registrations.IndexView extends Backbone.View
  template: JST["backbone/templates/registrations/index"]

  initialize: () ->
    @options.registrations.bind('reset', @addAll)

  addAll: () =>
    @options.registrations.each(@addOne)

  addOne: (registration) =>
    view = new TodoListOnRails.Views.Registrations.RegistrationView({model : registration})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(registrations: @options.registrations.toJSON() ))
    @addAll()

    return this
