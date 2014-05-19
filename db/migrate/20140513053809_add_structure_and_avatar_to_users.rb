class AddStructureAndAvatarToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :structure, :string
    add_column :users, :fonction, :string
    add_column :users, :avatar, :string
  end
  def self.down
    add_column :users, :structure, :string
    add_column :users, :fonction, :string
    add_column :users, :avatar, :string
  end
end
