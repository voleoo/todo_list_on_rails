TodoListOnRails.Views.Logins ||= {}

class TodoListOnRails.Views.Logins.IndexView extends Backbone.View
  template: JST["backbone/templates/logins/index"]

  initialize: () ->
    @options.logins.bind('reset', @addAll)

  addAll: () =>
    @options.logins.each(@addOne)

  addOne: (login) =>
    view = new TodoListOnRails.Views.Logins.LoginView({model : login})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(logins: @options.logins.toJSON() ))
    @addAll()

    return this
