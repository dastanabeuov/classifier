class PropertiesController < ApplicationController
  load_and_authorize_resource

  def destroy
    property.destroy if current_user.author_of?(property.propertyable)
  end
  
  def index
    @properties = Property.all
  end

  def show; end

  def new; end

  def edit; end

  def create
    @property = current_user.properties.new(property_params)
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, success: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, error: 'Property is not created.' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if current_user.author_of?(property) && property.update(property_params)
        format.html { redirect_to @property, success: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, error: 'Property is not updated.' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.author_of?(property)
      property.destroy
      respond_to do |format|
        format.html { redirect_to properties_url, success: 'Property was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

    def property
      @property ||= params[:id] ? Property.find(params[:id]) : Property.new
    end

    helper_method :property    

    def property_params
      params.require(:property).permit(:name, :description, :activity_id)
    end
end
