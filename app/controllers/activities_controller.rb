class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  authorize_resource

  respond_to :js, :json
  
  def index
    @activities = Activity.all
    respond_with(@activities)
  end

  def show
    respond_with(@activity)
  end

  def edit; end

  def new
    @activity = Activity.new
    @activity.properties.new
    @activity.parent_id = params[:parent_id]
    respond_with(@activity)
  end

  def create
    @activity = current_user.activities.build(activity_params)
    @activity.save
    respond_with(@activity)
  end

  def update
    @activity.update(activity_params) if current_user.author_of?(@activity)
    respond_with(@activity)
  end

  def destroy
    respond_with(@activity.destroy) if current_user.author_of?(@activity)
  end

  private

  def set_activity  
    @activity ||= Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :description, 
      :synonym, :code, :version_date, :publish, :position, 
      :parent_id,
      properties_attributes: [:id, :name, :description, :activity_id, :_destroy])
  end
end