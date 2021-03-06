TodoListOnRails.Views.Tasks ||= {}

class TodoListOnRails.Views.Tasks.TasksView extends Backbone.View

  tagName: "li"

  initialize: ->
    @model.bind "change", @render, @
    @model.bind "destroy", @remove, @
    @templateTask = HoganTemplates["tasks/task"]

  render: ->
    renderTask = @templateTask.render(@model.toJSON())
    $(@el).html renderTask
    $(@el).addClass "task"
    @

  events:
    "click .option-trash": "clear"
    "click input[type=checkbox]": "checked"
    "click .option-edit": "edit"
    "dblclick .task-body": "dbledit"
    "change input.edit-task": "edited"
    "click .sotr-up": "sortUp"
    "click .sotr-down": "sortDown"

  sortUp: ->
    console.log @
    arrayModels = @model.collection.where(project_id: @model.get("project_id"))
    arrayModels = _.sortBy(arrayModels, (model) ->
      model.get "position"
    )
    i = 0
    while arrayModels.length > i
      if arrayModels[i].get("position") is @model.get("position")
        tempPosition = arrayModels[i - 1].get("position")
        arrayModels[i - 1].set position: @model.get("position")
        arrayModels[i].set position: tempPosition
        arrayModels[i - 1].save()
        arrayModels[i].save()
      ++i

  sortDown: ->
    arrayModels = @model.collection.where(project_id: @model.get("project_id"))
    arrayModels = _.sortBy(arrayModels, (model) ->
      model.get "position"
    )
    i = 0
    while arrayModels.length > i
      if arrayModels[i].get("position") is @model.get("position")
        tempPosition = arrayModels[i + 1].get("position")
        arrayModels[i + 1].set position: @model.get("position")
        arrayModels[i].set position: tempPosition
        arrayModels[i + 1].save()
        arrayModels[i].save()
      ++i

  edit: ->
    if "displayBlock" is @model.get("displayBlock")
      @model.set
        displayBlock: "displayNone"
        displayNone: "displayBlock"

    else if "displayNone" is @model.get("displayBlock")
      @model.set
        displayBlock: "displayBlock"
        displayNone: "displayNone"

      @model.save()

  dbledit: ->
    @model.set
      displayBlock: "displayNone"
      displayNone: "displayBlock"


  edited: (e) ->
    @model.set
      displayBlock: "displayBlock"
      displayNone: "displayNone"
      name: $(e.currentTarget).val()

    @model.save()

  clear: ->
    @model.destroy()

  checked: ->
    if @model.get("done")
      @model.set done: false
    else
      @model.set done: true
    @model.save()
