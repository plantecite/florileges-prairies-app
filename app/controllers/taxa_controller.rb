class TaxaController < ApplicationController
  before_filter :set_index_params, :only => [:index]
  respond_to :json

  def index
    if params[:q].present?
      @query = params[:q].gsub("+", " ")
      @taxa = Taxon.search(@query).limit(params[:max_results]).order(:lb_nom, index_ranking: :desc)
    else
      @taxa = Taxon.all.limit(params[:max_results]).order(index_ranking: :desc)
    end
  end

  def show
    @taxon = Taxon.find(params[:id])
  end


  protected

   def set_index_params
     params[:max_results] ||= 10
   end
end