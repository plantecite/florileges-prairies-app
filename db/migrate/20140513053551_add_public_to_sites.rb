class AddPublicToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :public, :boolean
  end
   def self.down
    drop_column :sites, :public, :boolean
  end
end
