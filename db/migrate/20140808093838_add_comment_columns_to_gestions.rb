class AddCommentColumnsToGestions < ActiveRecord::Migration
  def self.up
  	add_column :gestions, :hist_cmt, :text
  	add_column :gestions, :hist_desc_cmt, :text
  end

  def self.down
  	remove_column :gestions, :hist_cmt
  	remove_column :gestions, :hist_desc_cmt
  end
end
