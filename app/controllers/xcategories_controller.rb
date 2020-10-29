class XcategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_xroot, only: %i[new create edit update]
  before_action :set_xcategory, only: %i[show edit update destroy]

  def index
    @xcategories = Xcategory.all
  end

  def show
    @xcategories = Xcategory.all
  end

  def edit; end

  def new
    @xcategory = @xroot.xcategories.new

    @xcategory.properties.new
  end

  def create
    @xcategory = @xroot.xcategories.new(xcategory_params)
    @xcategory.user = current_user
    respond_to do |format|
      if @xcategory.save
        format.html { redirect_to xroot_xcategory_path(@xroot, @xcategory), 
          success: 'Xcategory was successfully created.' }
        format.json { render :show, status: :created, location: @xcategory }
      else
        format.html { render :new, error: 'Xcategory is not created.' }
        format.json { render json: @xcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if current_user.author_of?(@xcategory) && @xcategory.update(xcategory_params)
        format.html { redirect_to xroot_xcategory_path(@xroot, @xcategory), 
          success: 'Xcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @xcategory }
      else
        format.html { render :edit, error: 'Xcategory is not updated.' }
        format.json { render json: @xcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.author_of?(@xcategory)
      @xcategory.destroy
      respond_to do |format|
        format.html { redirect_to xroot_path(@xcategory.xroot), 
          success: 'Xcategory was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

    def set_xroot
      @xroot ||= Xroot.find(params[:xroot_id])
    end

    def set_xcategory
      @xcategory ||= Xcategory.find(params[:id])
    end

    def xcategory_params
      params.require(:xcategory).permit(:name, :description, 
        :synonym, :code, :version_date, :publish,
        properties_attributes: [:id, :name, :description, :activity_id, :_destroy])
    end
end
