class AlterColumnOwnerForOwnerships < ActiveRecord::Migration
  def self.up
  	change_column :ownerships, :owner, :string
  end

  def self.down
  	change_column :ownerships, :owner, :boolean
  end
end
