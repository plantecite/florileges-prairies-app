  class GestionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_gestion, only: [:show, :edit, :update, :destroy]

  # GET /gestions
  # GET /gestions.json
  def index
    @site = Site.find(params[:site_id])
    @gestions = @site.gestions
  end

  # GET /gestions/1
  # GET /gestions/1.json
  def show
  end

  # GET /gestions/new
  def new
    @site = Site.find(params[:site_id])
    @gestion = @site.gestions.build
  end

  # GET /gestions/1/edit
  def edit
  end

  # POST /gestions
  # POST /gestions.json
  def create
    @site = Site.find(params[:site_id])
    @gestion = @site.gestions.build(gestion_params)

    respond_to do |format|
      if @gestion.save
        format.html { redirect_to sites_path, notice: 'La fiche de gestion a bien été créée.' }
        format.json { render action: 'show', status: :created, location: @gestion }
      else
        format.html { render action: 'new' }
        format.json { render json: @gestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gestions/1
  # PATCH/PUT /gestions/1.json
  def update
    respond_to do |format|
      if @gestion.update(gestion_params)
        format.html { redirect_to sites_path, notice: 'La fiche de gestion a bien été mise à jour.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gestions/1
  # DELETE /gestions/1.json
  def destroy

    @gestion.destroy
    respond_to do |format|
      format.html { redirect_to site_path(@site) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gestion
      @site = Site.find(params[:site_id])
      @gestion = @site.gestions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gestion_params
      params.require(:gestion).permit(:gestion_date, :gen_prop, :gen_gest, :gen_struct, :gen_surface, :gen_obj, :gen_freq, :hist_occsol, :hist_date, :hist_trav, :hist_trav_info, :hist_desc, :hist_desc_date, :it_trav, :it_trav_freq, :it_trav_freq_reginfo, :it_amend, :it_amend_freq, :it_amend_freq_reginfo, :it_gestion, :it_pat_nb, :it_pat_duree, :it_f_cal_prev, :it_f_cal_current, :it_p_cal_prev, :it_p_cal_current, :it_f_export, :it_phyto, :it_phyto_info, :it_pression, :scp_info, :scp_desc, :site_id, :tag_list)
    end

end
