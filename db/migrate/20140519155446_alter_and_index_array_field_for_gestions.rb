class AlterAndIndexArrayFieldForGestions < ActiveRecord::Migration
  def self.up
		change_column :gestions, :gen_obj, :string, array: true, default: '[]'
		change_column :gestions, :hist_occsol, :string, array: true, default: '[]'
		change_column :gestions, :hist_trav, :string, array: true, default: '[]'
		change_column :gestions, :it_trav_freq, :string, array: true, default: '[]'
		change_column :gestions, :it_trav_freq_reginfo, :string, array: true, default: '[]'
		change_column :gestions, :it_amend_freq, :string, array: true, default: '[]'
		change_column :gestions, :it_amend_freq_reginfo, :string, array: true, default: '[]'
		change_column :gestions, :it_phyto_info, :string, array: true, default: '[]'
  end

  def self.down
		change_column :gestions, :gen_obj, :string
		change_column :gestions, :hist_occsol, :string
		change_column :gestions, :hist_trav, :string
		change_column :gestions, :it_trav_freq, :string
		change_column :gestions, :it_trav_freq_reginfo, :string
		change_column :gestions, :it_amend_freq, :string
		change_column :gestions, :it_amend_freq_reginfo, :string
		change_column :gestions, :it_phyto_info, :string
  end
end
