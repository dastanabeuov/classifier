class Api::V1::ActivitiesController < Api::V1::BaseController
  def index
    @activities = Activity.all
    respond_with @activities
  end

  def show
    @acitivty = Activity.find(params[:id])
    respond_with @activity, serializer: SingleActivitySerializer
  end

  def create
    @activity = current_resource_owner.activities.create(activity_params)
    respond_with @activity, serializer: SingleActivitySerializer
  end

  def update
    @activity.update(activity_params) if current_resource_owner.author_of?(@activity)
    respond_with @activity, serializer: SingleActivitySerializer
  end

  def destroy
    @activity.destroy if current_resource_owner.author_of?(@acitivty)
    respond_with @acitivty
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description,
                                     :synonym, :code, :version_date, :publish, :position,
                                     :parent_id,
                                     properties_attributes: %i[id title activity_id _destroy])
  end
end
