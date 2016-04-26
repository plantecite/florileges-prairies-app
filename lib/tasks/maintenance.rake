require 'csv'

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
  task set_taxon_id: :environment do
    #Setting NP corrections dictionnary

    def init_dictionnary(filepath)
      filename = File.join Rails.root, filepath
      dic = Hash.new
      CSV.foreach(filename, {:col_sep => ",", :headers => true}) do |row|
        # puts "#{row['KEY']} est #{row['VALUE']}"
        k, v = row['KEY'], row['VALUE']
        #puts "#{k} is #{v}"
        dic[k] = v
      end
      return dic
    end

    #Init Dictionnary with CD_NOM
    fixes_with_CD_NOM = init_dictionnary("data/np_fixes_with_CD_NOM.csv")
    #Init Dictionnary with TAXA_ID
    fixes_with_TAXA_ID = init_dictionnary("data/np_fixes_with_TAXA_ID.csv")



    

    #Recherche de présence

    q = "Plantago major"
    if fixes_with_CD_NOM[q].nil?
      puts "#{q} n'est pas dans le dictionnaire de correction"
    else
      puts "#{q} est présent dans le dictionnaire et sa valeur est #{fixes_with_CD_NOM[q]}"
    end



    #Check for taxon presence

    #Parse NP coorections




  end
  
end