class RelevesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_releve, only: [:show, :edit, :update, :destroy]

  # GET /releves
  # GET /releves.json
  def index
    @site = Site.find(params[:site_id])
    @releves = @site.releves
  end

  # GET /releves/1
  # GET /releves/1.json
  def show
  end

  # GET /releves/new
  def new
    @site = Site.find(params[:site_id])
    @releve = @site.releves.build
  end

  # GET /releves/1/edit
  def edit
  end

  # POST /releves
  # POST /releves.json
  def create
    @site = Site.find(params[:site_id])
    @releve = @site.releves.build(gestion_params)

    respond_to do |format|
      if @releve.save
        format.html { redirect_to site_releves_path, notice: 'Le relevé a été créé avec succès.' }
        format.json { render action: 'show', status: :created, location: @releve }
      else
        format.html { render action: 'new' }
        format.json { render json: @releve.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /releves/1
  # PATCH/PUT /releves/1.json
  def update
    respond_to do |format|
      if @releve.update(gestion_params)
        format.html { redirect_to site_releves_path, notice: 'Le relevé a été mis à jour avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @releve.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /releves/1
  # DELETE /releves/1.json
  def destroy
    @releve.destroy
    respond_to do |format|
      format.html { redirect_to releves_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_releve
      @site = Site.find(params[:site_id])
      @releve = @site.releves.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def releve_params
      params.require(:releve).permit(:date, :name, :structure, :fonction, :time_start, :time_end, :hauteur, :milieux, :user_id, :site_id, :gestion_id)
    end
end
