TodoListOnRails.Views.Projects ||= {}

class TodoListOnRails.Views.Projects.ProjectView extends Backbone.View
  className : 'container'
  id : 'container'

  initialize: ->
    @template = JST["backbone/templates/projects/main"]
    @projects = @options.projects

    @projects.bind "add", @addOne, this
    @projects.bind "reset", @addAll, this
    @projects.fetch()
    @render()

  events:
    "click #create_project": "createProject"

  render: ->
    @.$el.html @template
    $('body').append @.$el
    @delegateEvents()
    console.log "render"
    @

  addOne: (Project) ->
    stView = new TodoListOnRails.Views.Projects.IndexView(model: Project)
    $("#content").append stView.render().el

  addAll: ->
    @projects.each @addOne

  createProject: ->
    @projects.create
      displayBlock: "displayNone"
      displayNone: "displayBlock"
    console.log 'привет'
