class WoodsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_wood, only: [:show, :edit, :update, :destroy]

  # GET /woods
  # GET /woods.json
  def index
    @woods = Wood.all
  end

  def index
    # @observations = Observation.all
    email = current_user.email
    # @observations = Observation.joins{releve.site.users}.where{{releve.site.users.email => email}}
    # @observations = Observation.joins{releve.site.users}.where{created_at >= 7.months.ago}
    # @observations = Observation.joins{releve.site.users}.where{releve.date >= 7.months.ago}
    @woods = Wood.joins{releve.site}.order{ releve.date.asc  }
    


    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"florileges-prairies-export-woods.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end

  end

  # GET /woods/1
  # GET /woods/1.json
  def show
  end

  # GET /woods/new
  def new
    @wood = Wood.new
  end

  # GET /woods/1/edit
  def edit
  end

  # POST /woods
  # POST /woods.json
  def create
    @wood = Wood.new(wood_params)

    respond_to do |format|
      if @wood.save
        format.html { redirect_to @wood, notice: 'Wood was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wood }
      else
        format.html { render action: 'new' }
        format.json { render json: @wood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /woods/1
  # PATCH/PUT /woods/1.json
  def update
    respond_to do |format|
      if @wood.update(wood_params)
        format.html { redirect_to @wood, notice: 'Wood was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /woods/1
  # DELETE /woods/1.json
  def destroy
    @wood.destroy
    respond_to do |format|
      format.html { redirect_to woods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wood
      @wood = Wood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wood_params
      params.require(:wood).permit(:q1, :q2, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :total, :releve_id)
    end
end
