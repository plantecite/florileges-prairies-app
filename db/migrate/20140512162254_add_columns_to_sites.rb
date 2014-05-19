class AddColumnsToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :password, :string
    add_column :sites, :topographie, :string
    add_column :sites, :ensoleillement, :string
    add_column :sites, :image, :string
  end
  def self.down
    drop_column :sites, :password, :string
    drop_column :sites, :topographie, :string
    drop_column :sites, :ensoleillement, :string
    drop_column :sites, :image, :string
  end

end
