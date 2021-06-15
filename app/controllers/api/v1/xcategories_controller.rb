class Api::V1::XcategoriesController < Api::V1::BaseController
  before_action :set_xroot, only: [:create]

  def index
    @xcategories = Xcategory.all
    respond_with @xcategories
  end

  def show
    @xcategory = Xcategory.find(params[:id])
    respond_with @xcategory, serializer: SingleXcategorySerializer
  end

  def create
    @xcategory = @xroot.xcategories.create(xcategory_params.merge(user: current_resource_owner))
    respond_with @xcategory
  end

  def update
    @xcategory.update(xcategory_params) if current_resource_owner.author_of?(@xcategory)
    respond_with @xcategory, serializer: SingleXcategorySerializer
  end

  def destroy
    @xcategory.destroy if current_resource_owner.author_of?(@xcategory)
    respond_with @xcategory
  end

  private

  def set_xroot
    @xroot = Xroot.find(params[:xroot_id])
  end

  def xcategory_params
    params.require(:xcategory).permit(:title, :description,
                                      :synonym, :code, :version_date, :publish,
                                      properties_attributes: %i[id title activity_id _destroy])
  end
end
