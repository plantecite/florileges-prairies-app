class ChangeFreqFormatInGestions < ActiveRecord::Migration
  def self.up
  	change_column :gestions, :gen_freq, :string, array: true, default: '[]'
  end

  def self.down
  	change_column :gestions, :gen_freq, :string
  end
end
