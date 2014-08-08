class AddColumnFauchePaturageToGestions < ActiveRecord::Migration
  def self.up
  	add_column :gestions, :it_gestion_p, :string
  	add_column :gestions, :it_gestion_f, :string
  end
  def self.down
  	remove_column :gestions, :it_gestion_p
		remove_column :gestions, :it_gestion_f
  end
end
