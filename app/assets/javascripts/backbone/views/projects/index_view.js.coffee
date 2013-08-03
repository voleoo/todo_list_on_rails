TodoListOnRails.Views.Projects ||= {}

class TodoListOnRails.Views.Projects.IndexView extends Backbone.View

  initialize: ->
    @tasks = new TodoListOnRails.Collections.TasksCollection()
    @tasks.fetch()

    @model.bind "change", @render, this
    @model.bind "destroy", @remove, this
    @template = JST["backbone/templates/projects/project"]
    @tasks.bind "reset", @addAllTasks, this
    console.log @

  addOneTask: (model) ->
    view = new TodoListOnRails.Views.Tasks.TasksView(model: model)
    $(@el).find("ul").append view.render().el

  addAllTasks: ->
    arrayModels = @tasks.where(project_id: @model.id)
    arrayModels = _.sortBy(arrayModels, (model) ->
      model.get "position"
    )
    for key of arrayModels
      @addOneTask arrayModels[key]

  updateTasks: ->
    console.log this

  render: ->
    renderProject = @template(@model.toJSON())
    $(@el).html renderProject
    $(@el).addClass "project"
    @addAllTasks this
    this

  events:
    "click .trash_head": "clear"
    "click .pencil_head": "edit"
    "dblclick .project_name": "dbledit"
    "change input.input_name": "edited"
    "click .create_task": "create_task"
    "change input.input_task": "create_task"

  create_task: ->
    model = @tasks.create(
      name: @$("input.input_task").val()
      project_id: @model.id
      position: @tasks.where((project_id: @model.id)).length + 1
    )
    @$("input.input_task").val ""
    @addOneTask model

  clear: ->
    @model.clear()

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
      project_name: $(e.currentTarget).val()

    @model.save()
