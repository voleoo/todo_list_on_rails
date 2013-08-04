TodoListOnRails.Views.Registrations ||= {}

class TodoListOnRails.Views.Registrations.NewView extends Backbone.View
  template: JST["backbone/templates/registrations/new"]

  events:
    "submit #new-registration": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (registration) =>
        @model = registration
        window.location.hash = "/#{@model.id}"

      error: (registration, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
