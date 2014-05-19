json.array!(@gestions) do |gestion|
  json.extract! gestion, :id, :gestion_date, :gen_prop, :gen_gest, :gen_struct, :gen_surface, :gen_obj, :gen_freq, :hist_occsol, :hist_date, :hist_trav, :hist_trav_info, :hist_desc, :hist_desc_date, :it_trav, :it_trav_freq, :it_trav_freq_reginfo, :it_amend, :it_amend_freq, :it_amend_freq_reginfo, :it_gestion, :it_pat_nb, :it_pat_duree, :it_f_cal_prev, :it_f_cal_current, :it_p_cal_prev, :it_p_cal_current, :it_f_export, :it_phyto, :it_phyto_info, :it_pression, :scp_info, :scp_desc, :site_id
  json.url gestion_url(gestion, format: :json)
end
