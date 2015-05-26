class AddPropageIdentifierToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :propage_identifier, :string
  end
  def self.down
    remove_column :sites, :propage_identifier
  end
end
