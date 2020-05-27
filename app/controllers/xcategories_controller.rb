class XcategoriesController < ApplicationController
  # GET /xcategories
  # GET /xcategories.json
  def index
    @xcategories = Xcategory.all
  end

  # GET /xcategories/1
  # GET /xcategories/1.json
  def show; end

  # GET /xcategories/new
  def new; end

  # GET /xcategories/1/edit
  def edit; end

  # POST /xcategories
  # POST /xcategories.json
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

  # PATCH/PUT /xcategories/1
  # PATCH/PUT /xcategories/1.json
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

  # DELETE /xcategories/1
  # DELETE /xcategories/1.json
  def destroy
    xcategory.destroy
    respond_to do |format|
      format.html { redirect_to xcategories_url, notice: 'Xcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def xcategory
      @xcategory ||= params[:id] ? Xcategory.find(params[:id]) : Xcategory.new
    end

    helper_method :xcategory

    # Only allow a list of trusted parameters through.
    def xcategory_params
      params.require(:xcategory).permit(:name, :description, :synonym, 
                                        :code, :version_date, 
                                        :publish, :xroot_id, :parent_id)
    end
end
