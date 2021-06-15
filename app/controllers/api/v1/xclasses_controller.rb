class Api::V1::XclassesController < Api::V1::BaseController
  before_action :set_xcategory, only: [:create]

  def index
    @xclasses = Xclass.all
    respond_with @xclasses
  end

  def show
    @xclass = Xclass.find(params[:id])
    respond_with @xclass, serializer: SingleXclassSerializer
  end

  def create
    @xclass = @xcategory.xclasses.create(xclass_params.merge(user: current_resource_owner))
    respond_with @xclass
  end

  def update
    @xclass.update(xclass_params) if current_resource_owner.author_of?(@xclass)
    respond_with @xclass, serializer: SingleXclassSerializer
  end

  def destroy
    @xclass.destroy if current_resource_owner.author_of?(@xclass)
    respond_with @xclass
  end

  private

  def set_xcategory
    @xcategory = Xcategory.find(params[:xcategory_id])
  end

  def xclass_params
    params.require(:xclass).permit(:title, :description,
                                   :synonym, :code, :version_date, :publish, :xtype,
                                   :position, :parent_id,
                                   properties_attributes: %i[id title activity_id _destroy])
  end
end
