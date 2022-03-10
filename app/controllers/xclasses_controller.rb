# frozen_string_literal: true

class XclassesController < ApplicationController
  authorize_resource

  before_action :set_xroot, only:     %i[show edit update destroy new create update_inline]
  before_action :set_xcategory, only: %i[show edit update destroy new create update_inline]
  before_action :set_xclass, only:    %i[show edit update destroy update_inline]
  before_action :set_resources, only: %i[xcategories_sub_children xcategories_sub_child]
  #  before_action :set_resources, only: %i[xcategories_sub_children xcategories_sub_child xclass_children xclass_child]

  respond_to :html, :js

  def xcategories_sub_children; end

  def xcategories_sub_child; end

  # def xclass_children; end

  # def xclass_child; end

  def set_resources
    set_xroot
    set_xcategory
    set_xclass
  end

  def show; end

  def edit; end

  def new
    @xclass = @xcategory.xclasses.new
    @xclass.parent_id = params[:parent_id]
    @xclass.properties.new
    respond_with(@xclass)
  end

  def create
    @xclass = @xcategory.xclasses.create(xclass_params)
    respond_with(@xroot, @xcategory, @xclass)
  end

  def update
    @xclass.update(xclass_params) if current_user.author_of?(@xclass)
    respond_with(@xroot, @xcategory, @xclass)
  end

  def update_inline
    if current_user.author_of?(@xclass) && @xclass.update(xclass_params)
      redirect_to xroot_xcategory_xclass_path(@xroot, @xcategory, @xclass)
    else
      render :update_inline
    end
  end

  def destroy
    @xclass.destroy if current_user.author_of?(@xclass)
    if @xclass.parent
      redirect_to xroot_xcategory_xclass_path(@xroot, @xcategory, @xclass.parent)
    else
      redirect_to xroot_xcategory_path(@xroot, @xcategory)
    end
    flash[:notice] = 'Xclass was successfully destroyed.'
  end

  private

  def set_xroot
    @xroot ||= Xroot.find(params[:xroot_id])
  end

  def set_xcategory
    @xcategory ||= Xcategory.find(params[:xcategory_id])
  end

  def set_xclass
    @xclass ||= Xclass.find(params[:id])
  end

  def xclass_params
    params.require(:xclass).permit(:title, :description,
                                   :synonym, :code, :full_code, :version_date, :publish, :xtype,
                                   :position, :parent_id,
                                   properties_attributes: %i[id title activity_id _destroy])
                                   .merge(user: current_user)
  end
end
