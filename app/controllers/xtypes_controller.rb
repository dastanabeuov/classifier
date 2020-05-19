class XtypesController < ApplicationController
  # GET /xtypes
  # GET /xtypes.json
  def index
    @xtypes = Xtype.all
  end

  # GET /xtypes/1
  # GET /xtypes/1.json
  def show; end

  # GET /xtypes/new
  def new; end

  # GET /xtypes/1/edit
  def edit; end

  # POST /xtypes
  # POST /xtypes.json
  def create
    @xtype = Xtype.new(xtype_params)

    respond_to do |format|
      if @xtype.save
        format.html { redirect_to @xtype, notice: 'xtype was successfully created.' }
        format.json { render :show, status: :created, location: @xtype }
      else
        format.html { render :new }
        format.json { render json: @xtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xtypes/1
  # PATCH/PUT /xtypes/1.json
  def update
    respond_to do |format|
      if xtype.update(xtype_params)
        format.html { redirect_to @xtype, notice: 'xtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @xtype }
      else
        format.html { render :edit }
        format.json { render json: @xtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xtypes/1
  # DELETE /xtypes/1.json
  def destroy
    xtype.destroy
    respond_to do |format|
      format.html { redirect_to xtypes_url, notice: 'xtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def xtype
      @xtype ||= params[:id] ? Xtype.find(params[:id]) : Xtype.new
    end

    helper_method :xtype

    # Only allow a list of trusted parameters through.
    def xtype_params
      params.require(:xtype).permit(:name, :description, :synonym, :code, :version_date, :publish, :user_id)
    end
end
