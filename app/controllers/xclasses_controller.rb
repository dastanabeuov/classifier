# frozen_string_literal: true

class XclassesController < ApplicationController
  authorize_resource

  before_action :set_xclass, only: %i[show edit update destroy import]
 
  respond_to :html

  def index
    @xclasses = Xclass.roots
    respond_with(@xclasses)
  end

  def show
    @xclasses = Xclass.roots
    respond_with(@xclass)
  end

  def edit
    respond_with(@xclass)
  end

  def new
    @xclass = Xclass.new(parent_id: params[:parent_id])
    @xclass.properties.new
    respond_with(@xclass)
  end

  def create
    @xclass = current_user.xclasses.new(xclass_params)
    @xclass.save
    respond_with(@xclass)
  end

  def update
    @xclass.update(xclass_params) if current_user.author_of?(@xclass)
    respond_with(@xclass)
  end

  def destroy
    @xclass.destroy if current_user.author_of?(@xclass)
    if @xclass.parent
      redirect_to @xclass.parent
      flash[:notice] = 'Xclass has been destroyed.'
    else
      redirect_to xclasses_path, status: :see_other
      flash[:notice] = 'Xclass has been destroyed.'
    end
  end

  def import
    count = Xclass.count
    Xclass.start_import(params[:file], current_user)
    redirect_to xclasses_path
    
    if Xclass.count > count
      flash[:notice] = t('xclass.controller.import')
    else
      flash[:error] = t('xclass.controller.not_import')
    end
  end

  private

  def set_xclass
    @xclass = Xclass.find(params[:id])
  end

  def xclass_params
    params.require(:xclass).permit(:title, :description,
                                   :synonym, :code, :full_code, 
                                   :version_date, :publish, 
                                   :xtype, :position, :parent_id,
                                    properties_attributes: %i[id title activity_id _destroy])
  end
end
