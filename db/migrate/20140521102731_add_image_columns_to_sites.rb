class AddImageColumnsToSites < ActiveRecord::Migration
  def self.up
  	rename_column :sites, :image, :photo
  	add_column :sites, :plan, :string
  end

  def self.down
  	rename_column :sites, :photo, :image
  	remove_column :sites, :plan, :string
  end
end
