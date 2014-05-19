class CreateGestions < ActiveRecord::Migration
  def self.up
    create_table :gestions do |t|
      t.date :gestion_date
      t.string :gen_prop
      t.string :gen_gest
      t.string :gen_struct
      t.integer :gen_surface
      t.string :gen_obj
      t.string :gen_freq
      t.string :hist_occsol
      t.string :hist_date
      t.string :hist_trav
      t.text :hist_trav_info
      t.text :hist_desc
      t.string :hist_desc_date
      t.string :it_trav
      t.string :it_trav_freq
      t.string :it_trav_freq_reginfo
      t.string :it_amend
      t.string :it_amend_freq
      t.string :it_amend_freq_reginfo
      t.string :it_gestion
      t.integer :it_pat_nb
      t.string :it_pat_duree
      t.string :it_f_cal_prev
      t.string :it_f_cal_current
      t.string :it_p_cal_prev
      t.string :it_p_cal_current
      t.boolean :it_f_export
      t.boolean :it_phyto
      t.string :it_phyto_info
      t.string :it_pression
      t.boolean :scp_info
      t.text :scp_desc
      t.references :site, index: true

      t.timestamps
    end
  end
  def self.down
    drop_table :gestions
  end
end
