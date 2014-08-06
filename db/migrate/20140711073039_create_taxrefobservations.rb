class CreateTaxrefobservations < ActiveRecord::Migration
  def self.up
    create_table :taxrefobservations do |t|
      t.boolean :q0
      t.boolean :q1
      t.boolean :q2
      t.boolean :q3
      t.boolean :q4
      t.boolean :q5
      t.boolean :q6
      t.boolean :q7
      t.boolean :q8
      t.boolean :q9
      t.boolean :q10
      t.boolean :p
      t.references :espece, index: true
      t.references :releve, index: true

      t.timestamps
    end
  end
  def self.down
    drop_table :taxrefobservations
  end
end
