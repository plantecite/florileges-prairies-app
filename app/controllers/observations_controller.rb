class ObservationsController < ApplicationController
  before_filter :authenticate_user!

  before_action :set_observation, only: [:show, :edit, :update, :destroy]
  before_filter :set_export_mode, only: [:index]

  # GET /observations
  # GET /observations.json
  def index
    # @observations = Observation.all
    email = current_user.email
    if params[:content]=='user'
      @observations = Observation.joins{releve.site.users}.where{{releve.site.users.email => email}}
    elsif params[:content]=='all'
      @valid_obs = Observation.where('taxon_id IS NOT NULL')
      @observations = @valid_obs
      # @observations = @valid_obs.joins{releve.site.users}.where{releve.site.users.email != 'gaetan@florileges.info'}.order{releve.date.asc}
    end
    # @observations = Observation.joins{releve.site.users}.where{created_at >= 7.months.ago}
    # @observations = Observation.joins{releve.site.users}.where{releve.date >= 7.months.ago}
    # @observations = Observation.joins{releve.site.users}.where{releve.site.users.email != 'gaetan@florileges.info'}.order{ releve.date.asc  }
    
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"florileges-prairies-export-observations.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
      format.xlsx
    end

  end

  # GET /observations/1
  # GET /observations/1.json
  def show
  end

  # GET /observations/new
  def new
    @observation = Observation.new
  end

  # GET /observations/1/edit
  def edit
  end

  # POST /observations
  # POST /observations.json
  def create
    @observation = Observation.new(observation_params)

    respond_to do |format|
      if @observation.save
        format.html { redirect_to @observation, notice: 'Observation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @observation }
      else
        format.html { render action: 'new' }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /observations/1
  # PATCH/PUT /observations/1.json
  def update
    respond_to do |format|
      if @observation.update(observation_params)
        format.html { redirect_to @observation, notice: 'Observation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observations/1
  # DELETE /observations/1.json
  def destroy
    @observation.destroy
    respond_to do |format|
      format.html { redirect_to observations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_export_mode
      params[:content] ||= 'user'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def observation_params
      params.require(:observation).permit(:q0, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :p, :releve_id, :taxon_id, :created_at, :updated_at, :CD_NOM, :CD_REF, :LB_NOM, :NOM_VALIDE, :florileges, :TAXREF_V)
    end
end
