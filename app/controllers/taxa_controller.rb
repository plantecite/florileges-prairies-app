class TaxaController < ApplicationController
  before_filter :set_index_params, :only => [:index]
  respond_to :json

  def index
    if params[:q].present?
      @query = params[:q].gsub("+", " ")
      @taxa = Taxon.search(@query).limit(params[:max_results])
    else
      @taxa = Taxon.all.limit(params[:max_results])
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