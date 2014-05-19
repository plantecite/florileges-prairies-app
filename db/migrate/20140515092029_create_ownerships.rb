class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer :user_id
      t.integer :site_id
      t.boolean :owner

      t.timestamps
    end
  end
end
