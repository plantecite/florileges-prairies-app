
namespace :ranking do 

  desc "Set Index Rank For Taxa"
  task taxa: :environment do
    default = 50
      Taxon.find_each do |taxon|
        score = default
        if taxon.fr == 'P'
          score+=10
        end
        if taxon.group1_inpn == "Algues"
          score-=10
        end
        if taxon.group1_inpn == "<Autres>"
          score-=10
        end
        if taxon.rang == 'ES'
          score += 10
        end
        if taxon.rang == 'GN'
          score += 30
        end
        if taxon.florileges
          score += 50
        end
        taxon.index_ranking = score
        taxon.save!
        puts "#{taxon.nom_complet} a un score d'index de #{taxon.index_ranking}"
      end

  end
  
end