class XrootsController < ApplicationController
  # GET /xroots
  # GET /xroots.json
  def index
    @xroots = Xroot.all
  end

  # GET /xroots/1
  # GET /xroots/1.json
  def show; end

  # GET /xroots/new
  def new; end

  # GET /xroots/1/edit
  def edit; end

  # POST /xroots
  # POST /xroots.json

  def create
    @xroot = Xroot.new(xroot_params)
 
    respond_to do |format|
      if @xroot.save
        format.html { redirect_to @xroot, notice: 'Xroot was successfully created.' }
        format.json { render :show, status: :created, location: @xroot }
      else
        format.html { render :new }
        format.json { render json: @xroot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xroots/1
  # PATCH/PUT /xroots/1.json
  def update
    respond_to do |format|
      if xroot.update(xroot_params)
        format.html { redirect_to @xroot, notice: 'Xroot was successfully updated.' }
        format.json { render :show, status: :ok, location: @xroot }
      else
        format.html { render :edit }
        format.json { render json: @xroot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xroots/1
  # DELETE /xroots/1.json
  def destroy
    xroot.destroy
    respond_to do |format|
      format.html { redirect_to xroots_url, notice: 'Xroot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def xroot      
      @xroot ||= params[:id] ? Xroot.find(params[:id]) : Xroot.new 
    end

    helper_method :xroot

    # Only allow a list of trusted parameters through.
    def xroot_params
      params.require(:xroot).permit(:name, :description, :synonym, :code, :version_date, :publish, :parent_id)
    end
end
