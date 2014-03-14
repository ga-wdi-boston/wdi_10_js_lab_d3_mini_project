class ProjectsController < ApplicationController
  def index
    @projects = Project.all

    render json: @projects
    # respond_to do |format|
    #   format.html
    #   format.json {render json: @projects, root: false }
    # end
  end
end
