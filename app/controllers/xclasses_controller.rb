class XclassesController < ApplicationController

  def index
    @xclasses = Xclass.all
  end

  def show; end

  def new; end

  def edit; end

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

  def destroy
    xclass.destroy
    respond_to do |format|
      format.html { redirect_to xclasses_url, notice: 'Xclass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def xclass
      @xclass ||= params[:id] ? Xclass.find(params[:id]) : Xclass.new
    end

    helper_method :xclass

    def xclass_params
      params.require(:xclass).permit(:name, :description, :synonym, :code, :version_date, :publish, :xtype, :position, :ancestry)
    end
end
