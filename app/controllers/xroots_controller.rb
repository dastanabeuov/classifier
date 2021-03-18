class XrootsController < ApplicationController
  before_action :set_xroot, only: %i[show edit update destroy]

  authorize_resource
  
  respond_to :js, :json

  def index
    @xroots = Xroot.all
    respond_with(@xroots)
  end

  def show
    respond_with(@xroot)
  end

  def edit; end

  def new
    @xroot = Xroot.new
    @xroot.properties.new
    respond_with(@xroot)
  end

  def create
    @xroot = current_user.xroots.create(xroot_params)
    respond_with(@xroot)
  end

  def update
    @xroot.update(xroot_params) if current_user.author_of?(@xroot)
    respond_with(@xroot)
  end

  def destroy
    respond_with(@xroot.destroy) if current_user.author_of?(@xroot)
  end

  private

  def set_xroot
    @xroot ||= Xroot.find(params[:id])
  end

  def xroot_params
    params.require(:xroot).permit(:name, :description, 
      :synonym, :code, :version_date, :publish,
      properties_attributes: [:id, :name, :description, :activity_id, :_destroy])
  end
end
