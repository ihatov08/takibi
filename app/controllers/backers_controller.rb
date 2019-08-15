class BackersController < ApplicationController
  before_action :set_project_plan, only: %i[new create]

  def new
    @backer = @project_plan.backers.build
  end

  def create
    @backer = @project_plan.backers.build
  end

  private

  def set_project_plan
    @project_plan = ProjectPlan.find(params[:project_plan_id])
  end
end
