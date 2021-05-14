class Api::V1::XrootsController < Api::V1::BaseController
  def index
    @xroots = Xroot.all
    respond_with @xroots
  end

  def show
    @xroot = Xroot.find(params[:id])
    respond_with @xroot, serializer: SingleXrootSerializer
  end

  def create
    @xroot = current_resource_owner.xroots.create(xroot_params)
    respond_with @xroot, serializer: SingleXrootSerializer
  end

  def update
    @xroot.update(xroot_params) if current_resource_owner.author_of?(@xroot)
    respond_with @xroot, serializer: SingleXrootSerializer
  end

  def destroy
    @xroot.destroy if current_resource_owner.author_of?(@xroot)
    respond_with @xroot
  end

  private

  def xroot_params
    params.require(:xroot).permit(:title, :description, 
      :synonym, :code, :version_date, :publish,
      properties_attributes: [:id, :title, :activity_id, :_destroy])
  end
end