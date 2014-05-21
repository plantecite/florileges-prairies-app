json.array!(@especes) do |espece|
  json.extract! espece, :id, :taxref, :bdtfx, :famille, :nom_sci, :auteur, :annee, :nom_sci_complet, :nom_vern, :avatar, :reconnaissance, :confusion, :habitat_desc, :faune, :flo_s, :flo_i, :indic_pel, :indic_pra, :indic_fri, :tol_fau, :tol_pat, :tol_pie, :off_nec, :off_pol, :pollen, :hauteur
  json.url espece_url(espece, format: :json)
end
