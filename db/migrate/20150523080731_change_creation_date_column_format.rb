class ChangeCreationDateColumnFormat < ActiveRecord::Migration
  def self.up
    change_column :sites, :hist_date, :string
  end

  def self.down
    change_column :sites, :hist_date, :date
  end
end
