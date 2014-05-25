class CreateReleves < ActiveRecord::Migration
  def self.up
    create_table :releves do |t|
      t.date :date
      t.text :name
      t.string :structure
      t.string :fonction
      t.time :time_start
      t.time :time_end
      t.string :hauteur
      t.string :milieux
      t.references :user, index: true
      t.references :site, index: true
      t.references :gestion, index: true

      t.timestamps
    end
  end

  def self.down
    drop_table :releves
  end

end
