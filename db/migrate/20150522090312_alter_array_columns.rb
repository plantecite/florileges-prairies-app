class AlterArrayColumns < ActiveRecord::Migration
  def self.up
    remove_column :releves, :fauche
    remove_column :releves, :fauche_periode
    remove_column :releves, :fauche_freq
    remove_column :releves, :paturage
    remove_column :releves, :traitement
    remove_column :releves, :pression
    remove_column :sites, :gen_obj
    remove_column :sites, :hist_occsol
    remove_column :sites, :hist_trav
    remove_column :sites, :cult_amend
    remove_column :sites, :cult_amend_freq
    remove_column :sites, :cult_trav
    remove_column :sites, :cult_trav_freq
    remove_column :sites, :cult_trav_freqinfo

    add_column :releves, :fauche, :string
    add_column :releves, :fauche_periode, :string
    add_column :releves, :fauche_freq, :string
    add_column :releves, :paturage, :string
    add_column :releves, :traitement, :string
    add_column :releves, :pression, :string
    add_column :sites, :gen_obj, :string
    add_column :sites, :hist_occsol, :string
    add_column :sites, :hist_trav, :string
    add_column :sites, :cult_amend, :string
    add_column :sites, :cult_amend_freq, :string
    add_column :sites, :cult_trav, :string
    add_column :sites, :cult_trav_freq, :string
    add_column :sites, :cult_trav_freqinfo, :string
  end


  def self.down
    change_column :releves, :fauche, :string, array: :true, default: '[]'
    change_column :releves, :fauche_periode, :string, array: :true, default: '[]'
    change_column :releves, :fauche_freq, :string, array: :true, default: '[]'
    change_column :releves, :paturage, :string, array: :true, default: '[]'
    change_column :releves, :traitement, :string, array: :true, default: '[]'
    change_column :releves, :pression, :string, array: :true, default: '[]'
    change_column :sites, :gen_obj, :string, array: :true, default: '[]'
    change_column :sites, :hist_occsol, :string, array: :true, default: '[]'
    change_column :sites, :hist_trav, :string, array: :true, default: '[]'
    change_column :sites, :cult_amend, :string, array: :true, default: '[]'
    change_column :sites, :cult_amend_freq, :string, array: :true, default: '[]'
    change_column :sites, :cult_trav, :string, array: :true, default: '[]'
    change_column :sites, :cult_trav_freq, :string, array: :true, default: '[]'
    change_column :sites, :cult_trav_freqinfo, :string, array: :true, default: '[]'
  end
end
