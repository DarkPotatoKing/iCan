class ProjectsController < ApplicationController
  load_and_authorize_resource
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = 'Project was saved!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end

end
