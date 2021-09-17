class XrootsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  before_action :set_xroot, only: %i[show edit update destroy update_inline xcategories_xcategory]

  after_action :publish_xroot, only: [:create]

  respond_to :html, :js

  def xcategories_xcategory; end

  def index
    @xroots = Xroot.all
    respond_with(@xroots)
  end

  def show; end

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
    @xroot.destroy if current_user.author_of?(@xroot)
    respond_with @xroot
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
    params.require(:xroot).permit(:title, :description,
                                  :synonym, :code, :version_date, :publish,
                                  properties_attributes: %i[id title activity_id _destroy])
  end
end
