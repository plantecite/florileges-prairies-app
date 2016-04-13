class Taxon < ActiveRecord::Base

  has_many :observations

  # include AlgoliaSearch
  # algoliasearch index_name: "florilegesTaxa", :disable_indexing => Rails.env.test? do
  #   attribute :lb_nom
  #   attributesToIndex [] # order matters, used by the ranking
  #   customRanking ['desc(index_ranking)','asc(lb_nom)'] # hit with same relevancy are sorted by name (ascending)
  # end

  def self.is_indexed?
    where do
      ((fr == 'P')) & 
      ((rang == 'ES') | (rang == 'GN'))
    end
  end

  def self.search(query)
    where do
      ((fr == 'P')) & 
      ((rang == 'ES') | (rang == 'GN')) & 
      (lb_nom =~ "%#{query}%")
    end
  end

end
