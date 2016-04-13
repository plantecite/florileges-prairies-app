namespace :maintenance do 

  desc "Set Florileges List default to false"
  task  taxa_florileges_default: :environment do
    Taxon.find_each do |taxon|
      if taxon.florileges.nil?
        taxon.florileges = false
        taxon.save!
      end
    end
  end

  desc "Set Florileges Species List"
  task set_florileges_list: :environment do
    list = ["Achillea millefolium",
        "Agrostis capillaris",
        "Agrostis stolonifera",
        "Anacamptis pyramidalis",
        "Anisantha sterilis",
        "Anthoxanthum odoratum",
        "Arctium lappa",
        "Arctium minus",
        "Arrhenatherum elatius",
        "Bellis perennis",
        "Campanula rapunculus",
        "Cerastium fontanum subsp. vulgare",
        "Chenopodium album",
        "Cirsium arvense",
        "Cirsium vulgare",
        "Convolvulus arvensis",
        "Dactylis glomerata",
        "Daucus carota",
        "Geranium dissectum",
        "Heracleum sphondylium",
        "Holcus lanatus",
        "Hypochaeris radicata",
        "Jacobaea vulgaris",
        "Knautia arvensis",
        "Lathyrus pratensis",
        "Leucanthemum vulgare",
        "Lolium perenne",
        "Lotus corniculatus",
        "Medicago lupulina",
        "Medicago sativa subsp. glomerata x Medicago sativa subsp. sativa",
        "Melilotus albus",
        "Pastinaca sativa",
        "Phleum pratense",
        "Picris hieracioides",
        "Plantago lanceolata",
        "Plantago major",
        "Poa pratensis",
        "Potentilla reptans",
        "Poterium sanguisorba",
        "Prunella vulgaris",
        "Ranunculus acris",
        "Ranunculus bulbosus",
        "Ranunculus repens",
        "Rumex acetosa",
        "Rumex obtusifolius",
        "Schedonorus arundinaceus",
        "Silene latifolia subsp. alba",
        "Tanacetum vulgare",
        "Tragopogon pratensis",
        "Trifolium fragiferum",
        "Trifolium pratense",
        "Trifolium repens",
        "Trisetum flavescens",
        "Urtica dioica",
        "Verbascum thapsus",
        "Vicia segetalis"]

      list.each do |species|
        Taxon.find_by_lb_nom(species) do |t|
          t.florileges = true
          t.save!
          puts "#{t.nom_complet} a été ajouté à la liste Florilèges"
        end
      end

  end

  desc "Set Florileges Species List"
  task set_taxon_id_from_natureparif: :environment do
    #Configure here!


  end
  
end