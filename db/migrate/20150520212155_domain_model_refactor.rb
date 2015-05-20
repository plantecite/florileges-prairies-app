class DomainModelRefactor < ActiveRecord::Migration
  def change
    change_table :sites do |t|
      t.remove :ensoleillement, :name, :parc, :topographie
      t.boolean :propage
      t.string :gen_freq
      t.string :gen_gest
      t.text :gen_obj, array: true, default: []
      t.integer :gen_surface
      t.datetime :gestion_date
      t.string :hist_date
      t.text :hist_occsol, array: true, default: []
      t.text :hist_trav, array: true, default: []
      t.text :cult_amend, array: true, default: []
      t.text :cult_amend_freq, array: true, default: []
      t.text :cult_trav, array: true, default: []
      t.text :cult_trav_freq, array: true, default: []
      t.text :cult_trav_freqinfo, array: true, default: []
    end

    change_table :releves do |t|
      t.remove :gestion_id
      t.boolean :semis
      t.text :fauche, array: true, default: []
      t.text :fauche_periode, array: true, default: []
      t.text :fauche_freq, array: true, default: []
      t.boolean :fauche_export
      t.text :paturage, array: true, default: []
      t.integer :paturage_pression
      t.integer :paturage_duree
      t.text :traitement, array: true, default: []
      t.text :pression, array: true, default: []
    end

    change_table :observations do |t|
      t.remove :espece_id
      t.integer :CD_NOM
      t.integer :CD_REF
      t.string :LB_NOM
      t.string :NOM_VALIDE
      t.boolean :florileges
      t.string :TAXREF_V
    end
    
    drop_table :gestions
    drop_table :taxrefobservations    
  end
end
