json.array!(@sites) do |site|
  json.extract! site, :code, :latitude, :longitude, :location, :created_at, :updated_at, :password, :photo, :public, :plan, :propage, :gen_freq, :gen_gest, :gen_surface, :gestion_date, :hist_date, :gen_obj, :hist_occsol, :hist_trav, :cult_amend, :cult_amend_freq, :cult_trav, :cult_trav_freq, :cult_trav_freqinfo, :releves

  json.url site_url(site, format: :json)


end