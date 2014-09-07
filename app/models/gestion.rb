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
	serialize :it_gestion

	before_save :standardise_date, :unless => :gestion_date?

	validates_presence_of :gestion_date, :gen_surface, :gen_obj, :gen_freq, :hist_date, :it_trav, :it_amend, 
	:it_f_cal_prev, :it_f_cal_current, :it_p_cal_prev, :it_p_cal_current, 
	:it_pression, :site_id, :message => "le champ ci-dessus doit être rempli !"

	validates_inclusion_of :it_f_export,:it_phyto, :scp_info, :in => [TRUE, FALSE], :message => "le champ ci-dessus doit être rempli !"

	validates_format_of :hist_date, :with => /[0-9]{4}[[:blank:]]*[-]?[[:blank:]]*([0-9]{4})?/, :allow_blank => true, :message => "Votre saisie est incorrecte."
	validates_format_of :hist_desc_date, :with => /[0-9]{4}[[:blank:]]*[-]?[[:blank:]]*([0-9]{4})?/, :allow_blank => true, :message => "Votre saisie est incorrecte"
	validates_format_of :hist_trav_date, :with => /[0-9]{2,4}[[:blank:]]*[-]?[[:blank:]]*([0-9]{4})?/, :allow_blank => true, :message => "Votre saisie est incorrecte."
	validates_format_of :it_pat_duree, :with => /[0-9]+/, :allow_blank => true, :message => "Votre saisie est incorrecte."

	validates_numericality_of :gen_surface,  :greater_than => 129, :message => "Veuillez saisir un nombre entier supérieur à 130."

  #Standardise Datepicker format
  def standardise_date
    self.gestion_date = gestion_date.strptime("%Y/%m/%d")
  end
end
