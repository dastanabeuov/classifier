class XcategoriesController < ApplicationController

  def index
    @xcategories = Xcategory.all
  end

  def show; end

  def new; end

  def edit; end

  def create
    @xcategory = Xcategory.new(xcategory_params)

    respond_to do |format|
      if @xcategory.save
        format.html { redirect_to @xcategory, notice: 'Xcategory was successfully created.' }
        format.json { render :show, status: :created, location: @xcategory }
      else
        format.html { render :new }
        format.json { render json: @xcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if xcategory.update(xcategory_params)
        format.html { redirect_to @xcategory, notice: 'Xcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @xcategory }
      else
        format.html { render :edit }
        format.json { render json: @xcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    xcategory.destroy
    respond_to do |format|
      format.html { redirect_to xcategories_url, notice: 'Xcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def xcategory
      @xcategory ||= params[:id] ? Xcategory.find(params[:id]) : Xcategory.new
    end

    helper_method :xcategory

    def xcategory_params
      params.require(:xcategory).permit(:name, :description, :synonym, 
                                        :code, :version_date, 
                                        :publish, :parent_id)
    end
end
