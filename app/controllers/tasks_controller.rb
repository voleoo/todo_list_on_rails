class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all
    respond_to do | format |
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      respond_to do | format |
        format.json { render json: @task }
      end
    else
      respond_to do | format |
        format.json { render json: @task }
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      respond_to do | format |
        format.json { render json: @task }
      end
    else
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    render json: 'destroed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :project_id, :position, :done)
    end
end
