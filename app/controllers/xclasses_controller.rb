class XclassesController < ApplicationController
  before_action :set_xroot, only:     %i[show edit update destroy new create update_inline]
  before_action :set_xcategory, only: %i[show edit update destroy new create update_inline]
  before_action :set_xclass, only:    %i[show edit update destroy update_inline]

  authorize_resource
  
  respond_to :js, :json

  def show
    respond_with(@xclass)
  end
  
  def edit; end

  def new
    @xclass = @xcategory.xclasses.new
    @xclass.parent_id = params[:parent_id]
    @xclass.properties.new
    respond_with(@xclass)
  end

  def create
    @xclass = @xcategory.xclasses.build(xclass_params)
    @xclass.user = current_user
    @xclass.save
    respond_with(@xroot, @xcategory, @xclass)
  end

  def update
    @xclass.update(xclass_params) if current_user.author_of?(@xclass)
    respond_with(@xroot, @xcategory, @xclass)
  end

  def update_inline
    if current_user.author_of?(@xclass) && @xclass.update(xclass_params)
      respond_with(@xroot, @xcategory, @xclass)
    else
      render :show
    end
  end

  def destroy
    @xclass.destroy if current_user.author_of?(@xclass)
    if @xclass.parent
      respond_with(@xroot, @xcategory, @xclass.parent)
    else
      respond_with(@xroot, @xcategory)
    end
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
    params.require(:xclass).permit(:name, :description, 
      :synonym, :code, :version_date, :publish, :xtype, 
      :position, :parent_id,
      properties_attributes: [:id, :name, :description, :activity_id, :_destroy])
  end
end
