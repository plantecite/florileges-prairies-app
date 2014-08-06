class TaxrefobservationsController < ApplicationController
  before_action :set_taxrefobservation, only: [:show, :edit, :update, :destroy]

  # GET /taxrefobservations
  # GET /taxrefobservations.json
  def index
    @taxrefobservations = Taxrefobservation.all
  end

  # GET /taxrefobservations/1
  # GET /taxrefobservations/1.json
  def show
  end

  # GET /taxrefobservations/new
  def new
    @taxrefobservation = Taxrefobservation.new
  end

  # GET /taxrefobservations/1/edit
  def edit
  end

  # POST /taxrefobservations
  # POST /taxrefobservations.json
  def create
    @taxrefobservation = Taxrefobservation.new(taxrefobservation_params)

    respond_to do |format|
      if @taxrefobservation.save
        format.html { redirect_to @taxrefobservation, notice: 'Taxrefobservation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @taxrefobservation }
      else
        format.html { render action: 'new' }
        format.json { render json: @taxrefobservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taxrefobservations/1
  # PATCH/PUT /taxrefobservations/1.json
  def update
    respond_to do |format|
      if @taxrefobservation.update(taxrefobservation_params)
        format.html { redirect_to @taxrefobservation, notice: 'Taxrefobservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @taxrefobservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxrefobservations/1
  # DELETE /taxrefobservations/1.json
  def destroy
    @taxrefobservation.destroy
    respond_to do |format|
      format.html { redirect_to taxrefobservations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taxrefobservation
      @taxrefobservation = Taxrefobservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taxrefobservation_params
      params.require(:taxrefobservation).permit(:q0, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :p, :CD_REF, :CD_NOM, :LB_NOM, :NOM_VALIDE, :releve_id)
    end
end
