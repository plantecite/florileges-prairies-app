require 'rubygems'
require 'algoliasearch'
require 'json'

class Observation < ActiveRecord::Base
  belongs_to :releve
  
  # #from former Taxrefobservation Model
  # #####################################
  before_save :taxref_update

  def taxref_update
    Algolia.init :application_id => ENV['ALGOLIASEARCH_APPLICATION_ID'], :api_key => ENV['ALGOLIASEARCH_API_KEY']
    @index = Algolia::Index.new("Taxref")
    taxref=@index.search(self.LB_NOM).to_json # !! Attention Algolia Ruby Client
    taxref_parsed=JSON.parse(taxref)
    res=taxref_parsed["hits"]
    unless res.empty?
      self.CD_REF = res[0]['CD_REF'].to_i
      self.NOM_VALIDE = res[0]['NOM_VALIDE'].to_s
      self.CD_NOM = res[0]['CD_NOM'].to_i
      self.florileges = res[0]['florileges'].to_s
    else
      self.CD_REF = nil
      self.NOM_VALIDE = nil
      self.CD_NOM = nil
    end
  end


end
