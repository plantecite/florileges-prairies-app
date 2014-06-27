class SitesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites
  # GET /sites.json
  def index
    @sites = current_user.sites
    @hash = Gmaps4rails.build_markers(@sites) do |site, marker|
      marker.lat site.latitude
      marker.lng site.longitude
      marker.infowindow site.name
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @hash = Gmaps4rails.build_markers(@site) do |site, marker|
      marker.lat site.latitude
      marker.lng site.longitude
      marker.infowindow site.name
    end
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
    @hash = Gmaps4rails.build_markers(@site) do |site, marker|
      marker.lat site.latitude
      marker.lng site.longitude
    end 
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.create(site_params)
    @site.ownerships.build(owner: 'true', user_id: current_user.id)
    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Le site de la prairie a été crée avec succès.' }
        format.json { render action: 'show', status: :created, location: @site }
      else
        format.html { render action: 'new' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to sites_url, notice: 'Le site a bien été mis à jour.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:code, :name, :parc, :latitude, :longitude, :location, :password, :topographie, :ensoleillement, :photo, :public, :plan)
    end
end
