class XrootsController < ApplicationController
  before_action :set_xroot, only: %i[show edit update destroy update_inline]
  after_action :publish_xroot, only: [:create]
  
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

  def update_inline
    if current_user.author_of?(@xroot) && @xroot.update(xroot_params)
      redirect_to @xroot
    else
      render :update_inline
    end
  end

  def destroy
    respond_with(@xroot.destroy) if current_user.author_of?(@xroot)
  end

  private

  def publish_xroot
    return if @xroot.errors.any?
    ActionCable.server.broadcast(
      'xroots',
      ApplicationController.render(
        partial: 'xroots/xroot',
        locals: { xroot: @xroot }, layout: false
      )
    )
  end

  def set_xroot
    @xroot ||= Xroot.find(params[:id])
  end

  def xroot_params
    params.require(:xroot).permit(:name, :description, 
      :synonym, :code, :version_date, :publish,
      properties_attributes: [:id, :name, :description, :activity_id, :_destroy])
  end
end
