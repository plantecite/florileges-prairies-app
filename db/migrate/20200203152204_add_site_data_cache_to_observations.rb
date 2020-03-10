class AddSiteDataCacheToObservations < ActiveRecord::Migration
  def self.up
    add_column :observations, :site_owner_id_cache, :integer
    add_column :observations, :site_id_cache, :integer
    add_index :observations, :site_owner_id_cache
    add_index :observations, :site_id_cache
  end

  def self.down
    remove_column :observations, :site_owner_id_cache
    remove_column :observations, :site_id_cache
    remove_index :observations, :site_owner_id_cache
    remove_index :observations, :site_id_cache
  end
end
