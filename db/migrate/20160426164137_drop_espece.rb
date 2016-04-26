class DropEspece < ActiveRecord::Migration
  def self.up
    drop_table :especes
  end

  def self.down
    create_table :especes do |t|
      t.integer :taxref
      t.integer :bdtfx
      t.string :famille
      t.string :nom_sci
      t.string :auteur
      t.integer :annee
      t.string :nom_sci_complet
      t.string :nom_vern
      t.string :avatar
      t.text :reconnaissance
      t.text :confusion
      t.text :habitat_desc
      t.text :faune
      t.string :flo_s
      t.integer :flo_i
      t.integer :indic_pel
      t.integer :indic_pra
      t.integer :indic_fri
      t.integer :tol_fau
      t.integer :tol_pat
      t.integer :tol_pie
      t.integer :off_nec
      t.integer :off_pol
      t.string :pollen
      t.integer :hauteur

      t.timestamps
    end
  end
end
