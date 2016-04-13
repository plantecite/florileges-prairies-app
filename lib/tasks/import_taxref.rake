require 'csv'

namespace :import do 

  desc "Import Taxa from Taxref CSV"
  task taxa: :environment do
    filename = File.join Rails.root, "taxref.csv"
    CSV.foreach(filename, {:col_sep => "\t"}) do |row|
      p row
    end
  end
  
end