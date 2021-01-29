class XrootsController < ApplicationController
  load_and_authorize_resource

  before_action :set_xroot, only: %i[show edit update destroy]


  def index
    @xroots = Xroot.all
  end

  def show
    @xroots = Xroot.all
  end

  def edit; end

  def new
    @xroot = Xroot.new
    @xroot.properties.new
  end

  def create
    @xroot = current_user.xroots.new(xroot_params)
    respond_to do |format|
      if @xroot.save
        format.html { redirect_to @xroot }
        flash[:success] = 'Xroot was successfully created.'
        format.json { render :show, status: :created, location: @xroot }
      else
        format.html { render :new }
        flash[:error] = "Xroot is not created."
        format.json { render json: @xroot.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if current_user.author_of?(@xroot) && @xroot.update(xroot_params)
        format.html { redirect_to @xroot }
        flash[:success] = 'Xroot was successfully updated.'
        format.json { render :show, status: :ok, location: @xroot }
      else
        format.html { render :edit }
        flash[:error] = "Xroot is not updated."
        format.json { render json: @xroot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.author_of?(@xroot)
      @xroot.destroy
      respond_to do |format|
        format.html { redirect_to xroots_path }
        flash[:success] = 'Xroot was successfully destroyed.'
        format.json { head :no_content }
      end
    end
  end

  private

    def set_xroot
      @xroot ||= Xroot.find(params[:id])
    end

    def xroot_params
      params.require(:xroot).permit(:name, :description, 
        :synonym, :code, :version_date, :publish,
        properties_attributes: [:id, :name, :description, :activity_id, :_destroy])
    end

end
