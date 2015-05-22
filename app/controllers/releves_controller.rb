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
    @releve.observations.build
    @releve.woods.build
    @especes=Espece.all(:order => 'nom_sci ASC')
  end

  # GET /releves/1/edit
  def edit
    @especes=Espece.all(:order => 'nom_sci ASC')
  end

  # POST /releves
  # POST /releves.json
  def create
    @site = Site.find(params[:site_id])
    @releve = @site.releves.build(releve_params)
    @especes=Espece.all(:order => 'nom_sci ASC')

    respond_to do |format|
      if @releve.save
        format.html { redirect_to sites_path, notice: 'Votre fiche de relevés a bien été créée.' }
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
    @especes=Espece.all(:order => 'nom_sci ASC')
    respond_to do |format|
      if @releve.update(releve_params)
        format.html { redirect_to sites_path, notice: 'Votre fiche de relevés a bien été mise à jour. ' }
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
      format.html { redirect_to site_path(@site) }
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
      params.require(:releve).permit(:date, :name, :structure, :fonction, :time_start, :time_end, :hauteur, :milieux, :user_id, :site_id, :created_at, :updated_at, :semis, :fauche, :fauche_periode, :fauche_freq, :fauche_export, :paturage, :paturage_pression, :paturage_duree, :traitement, :pression, observations_attributes: [:id, :q0, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :p, :releve_id, :created_at, :updated_at, :CD_NOM, :CD_REF, :LB_NOM, :NOM_VALIDE, :florileges, :TAXREF_V, :_destroy], woods_attributes: [:id, :q0, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :total, :releve_id])
    end
end
