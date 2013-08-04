TodoListOnRails.Views.Registrations ||= {}

class TodoListOnRails.Views.Registrations.EditView extends Backbone.View
  template: JST["backbone/templates/registrations/edit"]

  events:
    "submit #edit-registration": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (registration) =>
        @model = registration
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
