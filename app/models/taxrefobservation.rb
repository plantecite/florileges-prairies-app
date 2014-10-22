require 'rubygems'
require 'algoliasearch'
require 'json'

class Taxrefobservation < ActiveRecord::Base
  belongs_to :releve


	before_save :taxref_update

	def taxref_update
		Algolia.init :application_id => ENV['ALGOLIASEARCH_APPLICATION_ID'], :api_key => ENV['ALGOLIASEARCH_API_KEY']
		@index = Algolia::Index.new("Taxref")
		taxref=@index.search(self.LB_NOM).to_json # !! Attention Algolia Ruby Client
		taxref_parsed=JSON.parse(taxref)
		res=taxref_parsed["hits"]
		self.CD_REF = res[0]['CD_REF'].to_i
		self.NOM_VALIDE = res[0]['NOM_VALIDE'].to_s
		self.CD_NOM = res[0]['CD_NOM'].to_i
	end

end

