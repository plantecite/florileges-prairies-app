class ChangeFlorilegesColumnToString < ActiveRecord::Migration
  def self.up
    change_column :observations, :florileges, :string
  end

  def self.down
    change_column :observations, :florileges, :boolean
  end
end
