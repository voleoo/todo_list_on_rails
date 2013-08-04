TodoListOnRails.Views.Projects ||= {}

class TodoListOnRails.Views.Projects.ProjectView extends Backbone.View
  className : 'container'
  id : 'container'

  initialize: ->
    @template = HoganTemplates['projects/main']
    @projects = @options.projects

    @projects.bind "add", @addOne, this
    @projects.bind "reset", @addAll, this
    @projects.fetch()
    @render()

  events:
    "click #create-project": "createProject"

  render: ->
    @.$el.html @template.render()
    $('body').append @.$el

  addOne: (Project) ->
    stView = new TodoListOnRails.Views.Projects.IndexView(model: Project)
    $("#content").append stView.render().el

  addAll: ->
    @projects.each @addOne

  createProject: ->
    @projects.create
      displayBlock: "displayNone"
      displayNone: "displayBlock"
