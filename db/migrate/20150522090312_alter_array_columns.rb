class AlterArrayColumns < ActiveRecord::Migration
  def self.up
    change_column :releves, :fauche, :string
    change_column :releves, :fauche_periode, :string
    change_column :releves, :fauche_freq, :string
    change_column :releves, :paturage, :string
    change_column :releves, :traitement, :string
    change_column :releves, :pression, :string
    change_column :sites, :gen_obj, :string
    change_column :sites, :hist_occsol, :string
    change_column :sites, :hist_trav, :string
    change_column :sites, :cult_amend, :string
    change_column :sites, :cult_amend_freq, :string
    change_column :sites, :cult_trav, :string
    change_column :sites, :cult_trav_freq, :string
    change_column :sites, :cult_trav_freqinfo, :string
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
