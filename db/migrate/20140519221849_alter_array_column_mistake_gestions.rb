class AlterArrayColumnMistakeGestions < ActiveRecord::Migration
  def self.up
  	remove_column :gestions, :gen_obj
		remove_column :gestions, :hist_occsol
		remove_column :gestions, :hist_trav
		remove_column :gestions, :it_trav_freq
		remove_column :gestions, :it_trav_freq_reginfo
		remove_column :gestions, :it_amend_freq
		remove_column :gestions, :it_amend_freq_reginfo
		remove_column :gestions, :it_phyto_info
		change_table :gestions do |t|
			t.string :gen_obj
			t.string :hist_occsol
			t.string :hist_trav
			t.string :it_trav_freq
			t.string :it_trav_freq_reginfo
			t.string :it_amend_freq
			t.string :it_amend_freq_reginfo
			t.string :it_phyto_info
		end
  end

  def self.down
		remove_column :gestions, :gen_obj
		remove_column :gestions, :hist_occsol
		remove_column :gestions, :hist_trav
		remove_column :gestions, :it_trav_freq
		remove_column :gestions, :it_trav_freq_reginfo
		remove_column :gestions, :it_amend_freq
		remove_column :gestions, :it_amend_freq_reginfo
		remove_column :gestions, :it_phyto_info
  end
end
