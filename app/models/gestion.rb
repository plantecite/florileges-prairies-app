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

	validates_presence_of :gestion_date
	# :gen_surface, :gen_obj, :gen_freq, :hist_date, :it_trav, :it_trav_freq, :it_trav_freq_reginfo, :it_amend, :it_amend_freq, :it_amend_freq_reginfo, :it_gestion, :it_pat_nb, :it_pat_duree, :it_f_cal_prev, :it_f_cal_current, :it_p_cal_prev, :it_p_cal_current, :it_f_export, :it_phyto, :it_phyto_info, :it_pression, :scp_info, :scp_desc, :site_id, :message => "doit être rempli!"

  #Standardise Datepicker format
  def standardise_date
    self.gestion_date = gestion_date.strptime("%Y/%m/%d")
  end
end
