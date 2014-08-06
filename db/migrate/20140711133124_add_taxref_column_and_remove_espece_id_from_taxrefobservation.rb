class AddTaxrefColumnAndRemoveEspeceIdFromTaxrefobservation < ActiveRecord::Migration
  def self.up
  	add_column :taxrefobservations, :CD_REF, :integer
  	add_column :taxrefobservations, :CD_NOM, :integer
  	add_column :taxrefobservations, :LB_NOM, :string
  	add_column :taxrefobservations, :NOM_VALIDE, :string
  	remove_column :taxrefobservations, :espece_id
  end

  def self.down
  	remove_column :taxrefobservations, :CD_REF
  	remove_column :taxrefobservations, :CD_NOM
  	remove_column :taxrefobservations, :LB_NOM
  	remove_column :taxrefobservations, :NOM_VALIDE
  	add_column :taxrefobservations, :espece_id, :integer
  end
end
