json.taxa @taxa do |taxa|
	json.id taxa.id
	json.cd_nom taxa.cd_nom
	json.cd_ref taxa.cd_ref
	json.lb_nom taxa.lb_nom
	json.nom_complet taxa.nom_complet
	json.nom_complet_html taxa.nom_complet_html
	json.nom_valide taxa.nom_valide
	json.nom_vern taxa.nom_vern
	json.florileges taxa.florileges
end