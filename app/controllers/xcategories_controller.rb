# frozen_string_literal: true

class XcategoriesController < ApplicationController
  authorize_resource

  before_action :set_xroot, only:     %i[show edit update destroy new create
                                         update_inline
                                         import
                                         sub_child
                                         sub_children
                                         xcategory_xclasses]

  before_action :set_xcategory, only: %i[show edit update destroy
                                         update_inline
                                         import
                                         sub_child
                                         sub_children
                                         xcategory_xclasses]

  after_action  :publish_xcategory, only: [:create]

  respond_to :html, :js, :json

  def xcategory_xclasses; end

  def show; end

  def edit; end

  def import
    count = @xcategory.xclasses.count
    @user = current_user
    Xcategory.start_import(params[:file], @xcategory, @user)
    redirect_to xroot_xcategory_path(@xroot, @xcategory)

    if @xcategory.xclasses.count > count
      flash[:notice] = 'Xclasses imported.'
    else
      flash[:error] = 'Xclasses is not imported.'
    end
  end

  def new
    @xcategory = @xroot.xcategories.new
    @xcategory.properties.new
    respond_with(@xcategory)
  end

  def create
    @xcategory = @xroot.xcategories.create(xcategory_params)
    DigestXcategoryJob
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
    redirect_to @xcategory.xroot
    flash[:notice] = 'Xcategory was successfully destroyed.'
  end

  private

  def publish_xcategory
    return if @xcategory.errors.any?

    ActionCable.server.broadcast(
      'xcategories',
      ApplicationController.render(
        partial: 'xcategories/xcategory',
        locals: { xcategory: @xcategory }, layout: false
      )
    )
  end

  def set_xroot
    @xroot ||= Xroot.find(params[:xroot_id])
  end

  def set_xcategory
    @xcategory ||= Xcategory.find(params[:id])
  end

  def xcategory_params
    params.require(:xcategory).permit(:title, :description,
                                      :synonym, :code, :version_date, :publish,
                                      properties_attributes: %i[id title activity_id _destroy])
                                      .merge(user: current_user)
  end
end
