class AddTaxonRefToObservations < ActiveRecord::Migration
  def self.up
    add_reference :observations, :taxon, index: true
  end

  def self.down
    remove_reference :observations, :taxon
  end
end
