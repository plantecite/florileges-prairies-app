class CreateTaxa < ActiveRecord::Migration
  def self.up
    create_table :taxa do |t|
      t.text :regne
      t.text :phylum
      t.text :classe
      t.text :ordre
      t.text :famille
      t.text :group1_inpn
      t.text :group2_inpn
      t.integer :cd_nom
      t.integer :cd_taxsup
      t.integer :cd_ref
      t.string :rang
      t.text :lb_nom
      t.text :lb_auteur
      t.text :nom_complet
      t.text :nom_complet_html
      t.text :nom_valide
      t.text :nom_vern
      t.text :nom_vern_eng
      t.string :habitat
      t.string :fr
      t.string :gf
      t.string :mar
      t.string :gua
      t.string :sm
      t.string :sb
      t.string :spm
      t.string :may
      t.string :epa
      t.string :reu
      t.string :taaf
      t.string :pf
      t.string :nc
      t.string :wf
      t.string :cli
      t.string :url
      t.integer :taxref_v
      t.boolean :florileges
      t.integer :index_ranking

      t.timestamps
    end
  end

  def self.down
    drop_table :taxa    
  end
end
