class PropertiesController < ApplicationController
  before_action :authenticate_user!
  authorize_resource
  
  before_action :set_property, only: %i[update destroy]

  respond_to :html

  def create
    @property = propertyable.properties.build(property_params)
    respond_with(@property)
  end

  def update
    @property.update(property_params) if current_user.author_of?(@property)
    respond_with(@property)
  end

  def destroy
    @property.destroy if current_user.author_of?(@property)
    respond_with @property
  end

  private

  def set_property
    @property ||= Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :description, :activity_id)
  end
end
