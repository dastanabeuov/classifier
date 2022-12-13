# frozen_string_literal: true

class ActivitiesController < ApplicationController
  authorize_resource

  before_action :set_activity, only: %i[show edit update destroy]

  respond_to :html

  def index
    @activities = Activity.all
    respond_with(@activities)
  end

  def show
    respond_with(@activity)
  end

  def edit
    respond_with(@activity)
  end

  def new
    @activity = Activity.new
    @activity.properties.new
    @activity.parent_id = params[:parent_id]
    respond_with(@activity)
  end

  def create
    @activity = current_user.activities.new(activity_params)
    @activity.save
    respond_with(@activity)
  end

  def update
    @activity.update(activity_params) if current_user.author_of?(@activity)
    respond_with(@activity)
  end

  def destroy
    @activity.destroy if current_user.author_of?(@activity)
    if @activity.parent
      respond_with(@activity.parent)
    else
      respond_with(@activity)
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description,
                                     :synonym, :code, 
                                     :version_date, :publish, 
                                     :position, :parent_id,
                                      properties_attributes: %i[id title activity_id _destroy])
  end
end
