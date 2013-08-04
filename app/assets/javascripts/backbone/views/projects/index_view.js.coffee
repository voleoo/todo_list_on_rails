TodoListOnRails.Views.Projects ||= {}

class TodoListOnRails.Views.Projects.IndexView extends Backbone.View

  initialize: ->
    @tasks = new TodoListOnRails.Collections.TasksCollection()
    @tasks.fetch()
    @tasks.bind "reset", @addAllTasks, this
    @tasks.bind "change:position", @updatePosition, this

    @model.bind "change", @render, this
    @model.bind "destroy", @remove, this
    @template = HoganTemplates["projects/project"]

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

  updatePosition: ->
    $(@el).find("ul").html('')
    @addAllTasks()

  render: ->
    renderProject = @template.render(@model.toJSON())
    $(@el).html renderProject
    $(@el).addClass "project"
    @addAllTasks this
    this

  events:
    "click .trash-head": "clear"
    "click .pencil-head": "edit"
    "dblclick .project-name": "dbledit"
    "change input.input-name": "edited"
    "click .button-create-task": "create_task"
    "change input.input-task": "create_task"

  create_task: ->
    console.log @$("input.input-task").val()
    model = @tasks.create(
      name: @$("input.input-task").val()
      project_id: @model.id
      position: @tasks.where((project_id: @model.id)).length + 1
    )
    @$("input.input-task").val ""
    @addOneTask model

  clear: ->
    @model.destroy()

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
