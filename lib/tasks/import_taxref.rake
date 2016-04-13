require 'csv'

namespace :import do 

  desc "Import Taxa from Taxref CSV"
  task taxa: :environment do
    filename = File.join Rails.root, "data/taxref.csv"
    counter = 0
    CSV.foreach(filename, {:col_sep => "\t", :headers => true}) do |row|
      taxon = Taxon.create(row.to_hash)
      puts "#{lb_nom} - #{taxon.full_messages.join(",")}" if taxon.errors.any?
      counter += 1 if taxon.persisted?
    end

    puts "Import de #{counter} taxa."
  end
  
end