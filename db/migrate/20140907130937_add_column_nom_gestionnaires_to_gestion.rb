class AddColumnNomGestionnairesToGestion < ActiveRecord::Migration
  def self.up
  	add_column :gestions, :gen_struct_name, :string
  end

  def self.down
  	remove_column :gestions, :gen_struct_name
  end
end
