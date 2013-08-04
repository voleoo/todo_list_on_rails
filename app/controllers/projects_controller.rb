class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def main
    @projects = Project.all
    respond_to do | format |
      format.html { render "projects/main" }
    end
  end
  # GET /projects
  def index
    @projects = Project.all
    respond_to do | format |
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  def show
    respond_to do | format |
      format.json { render json: @projects }
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      respond_to do | format |
        format.json { render json: @project }
      end
    else
      respond_to do | format |
        format.json { render json: @project }
      end
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      render json: @project
    else
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    render json: 'destroed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name, :project_id, :position, :done)
    end
end
