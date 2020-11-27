class XclassesController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_xcategory, only: %i[new create show edit update destroy]
  before_action :set_xclass, only: %i[show edit update destroy]

  def index
    @xclasses = Xclass.all
  end

  def show
    @xclasses = Xclass.all
  end

  def edit; end

  def new
    @xclass = @xcategory.xclasses.new
    @xclass.properties.new

    @xclass.parent_id = params[:parent_id]
    @xclass.properties.new
  end

  def create
    @xclass = @xcategory.xclasses.new(xclass_params)
    @xclass.user = current_user
    respond_to do |format|
      if @xclass.save
        format.html { redirect_to xroot_xcategory_xclass_path(@xcategory.xroot, @xcategory, @xclass), 
          success: 'Xclass was successfully created.' }
        format.json { render :show, status: :created, location: @xclass }
      else
        format.html { render :new, error: 'Xclass is not created.' }
        format.json { render json: @xclass.errors, status: :unprocessable_entity }
      end
    end  
  end

  def update
    respond_to do |format|
      if current_user.author_of?(@xclass) && @xclass.update(xclass_params)
        format.html { redirect_to xroot_xcategory_xclass_path(@xcategory.xroot, @xcategory, @xclass), 
          success: 'Xclass was successfully updated.' }
        format.json { render :show, status: :ok, location: @xclass }
      else
        format.html { render :edit, error: 'Xclass is not updated.' }
        format.json { render json: @xclass.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.author_of?(@xclass)
      @xclass.destroy
      respond_to do |format|
        format.html { 
          if @xclass.parent
            redirect_to xroot_xcategory_xclass_path(@xcategory.xroot, @xcategory, @xclass.parent), 
            success: 'Xclas was successfully destroyed.'
          else
            redirect_to xroot_xcategory_path(@xcategory.xroot, @xcategory), 
            success: 'Xclas was successfully destroyed.'
          end
        }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_xcategory
      @xcategory = Xcategory.find(params[:xcategory_id])
    end

    def set_xclass
      @xclass = Xclass.find(params[:id])
    end

    def xclass_params
      params.require(:xclass).permit(:name, :description, 
        :synonym, :code, :version_date, :publish, :xtype, 
        :position, :parent_id,
        properties_attributes: [:id, :name, :description, :activity_id, :_destroy])
    end
end
