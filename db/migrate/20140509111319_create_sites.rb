class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :code
      t.string :name
      t.string :parc
      t.decimal :latitude
      t.decimal :longitude
      t.string :location

      t.timestamps
    end
  end
end
