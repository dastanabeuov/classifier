class XclassesController < ApplicationController
  # GET /xclasses
  # GET /xclasses.json
  def index
    @xclasses = Xclass.all
  end

  # GET /xclasses/1
  # GET /xclasses/1.json
  def show; end

  # GET /xclasses/new
  def new; end

  # GET /xclasses/1/edit
  def edit; end

  # POST /xclasses
  # POST /xclasses.json
  def create
    @xclass = Xclass.new(xclass_params)

    respond_to do |format|
      if @xclass.save
        format.html { redirect_to @xclass, notice: 'Xclass was successfully created.' }
        format.json { render :show, status: :created, location: @xclass }
      else
        format.html { render :new }
        format.json { render json: @xclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xclasses/1
  # PATCH/PUT /xclasses/1.json
  def update
    respond_to do |format|
      if xclass.update(xclass_params)
        format.html { redirect_to @xclass, notice: 'Xclass was successfully updated.' }
        format.json { render :show, status: :ok, location: @xclass }
      else
        format.html { render :edit }
        format.json { render json: @xclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xclasses/1
  # DELETE /xclasses/1.json
  def destroy
    xclass.destroy
    respond_to do |format|
      format.html { redirect_to xclasses_url, notice: 'Xclass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def xclass
      @xclass ||= params[:id] ? Xclass.find(params[:id]) : Xclass.new
    end

    helper_method :xclass

    # Only allow a list of trusted parameters through.
    def xclass_params
      params.require(:xclass).permit(:name, :description, :synonym, 
                                     :code, :version_date, :publish, 
                                     :xtype, :xcategory_id, :parent_id)
    end
end
