class Gestion < ActiveRecord::Base
  
  belongs_to :site

  serialize :gen_obj
	serialize :hist_occsol
	serialize :hist_trav
	serialize :it_trav_freq
	serialize :it_trav_freq_reginfo
	serialize :it_amend_freq
	serialize :it_amend_freq_reginfo
	serialize :it_phyto_info

	before_save :standardise_date, :unless => :gestion_date?

  #Standardise Datepicker format
  def standardise_date
    self.gestion_date = gestion_date.strptime("%Y/%m/%d")
  end
end
