class ActivitiesController < ApplicationController
  load_and_authorize_resource

  def index
    @activities = Activity.all
  end

  def show; end

  def new
    @activity = Activity.new
    @activity.parent_id = params[:parent_id]
  end

  def edit; end

  def create
    @activity = current_user.activities.new(activity_params)
    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity }
        flash[:success] = 'Activity was successfully created.'
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        flash[:error] = 'Activity is not created.'
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if current_user.author_of?(activity) && activity.update(activity_params)
        format.html { redirect_to @activity }
        flash[:success] = 'Activity was successfully updated.'
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        flash[:error] = 'Activity is not updated.'
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.author_of?(activity)
      activity.destroy
      respond_to do |format|
        format.html { redirect_to activities_url }
        flash[:success] = 'Activity was successfully destroyed.'
        format.json { head :no_content }
      end
    end
  end

  private

    def activity
      @activity ||= params[:id] ? Activity.find(params[:id]) : Activity.new
    end

    helper_method :activity

    def activity_params
      params.require(:activity).permit(:name, :description, 
        :synonym, :code, :version_date, :publish, :position, 
        :parent_id)
    end
end
