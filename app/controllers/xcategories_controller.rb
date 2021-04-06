class XcategoriesController < ApplicationController
  before_action :set_xroot, only:     %i[show edit update destroy new create update_inline]
  before_action :set_xcategory, only: %i[show edit update destroy update_inline]

  authorize_resource

  respond_to :js, :json

  def show
    respond_with(@xcategory)
  end

  def edit; end

  def new
    @xcategory = @xroot.xcategories.new
    @xcategory.properties.new
    respond_with(@xcategory)
  end

  def create
    @xcategory = @xroot.xcategories.build(xcategory_params)
    @xcategory.user = current_user
    @xcategory.save
    respond_with(@xroot, @xcategory)
  end

  def update
    @xcategory.update(xcategory_params) if current_user.author_of?(@xcategory)
    respond_with(@xroot, @xcategory)
  end

  def update_inline
    if current_user.author_of?(@xcategory) && @xcategory.update(xcategory_params)
      redirect_to xroot_xcategory_path(@xroot, @xcategory)
    else
      render :update_inline
    end
  end

  def destroy
    @xcategory.destroy if current_user.author_of?(@xcategory)
    respond_with(@xroot)
  end

  private

  def set_xroot
    @xroot ||= Xroot.find(params[:xroot_id])
  end

  def set_xcategory
    @xcategory ||= Xcategory.find(params[:id])
  end

  def xcategory_params
    params.require(:xcategory).permit(:name, :description, 
      :synonym, :code, :version_date, :publish,
      properties_attributes: [:id, :name, :description, :activity_id, :_destroy])
  end
end
