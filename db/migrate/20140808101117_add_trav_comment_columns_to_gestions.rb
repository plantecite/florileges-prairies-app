class AddTravCommentColumnsToGestions < ActiveRecord::Migration
  def self.up
  	remove_column :gestions, :hist_desc_cmt
  	remove_column :gestions, :hist_trav_info
  	add_column :gestions, :hist_trav_date, :string
  	add_column :gestions, :hist_trav_cmt, :text
  end
  def self.down
  	remove_column :gestions, :hist_trav_date
  	remove_column :gestions, :hist_trav_cmt
  end
end
