class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.references :order,          null: false, foreign_key: true
      t.string :code,               null: false
      t.integer :place_id,          null: false
      t.string :city,               null: false
      t.string :street,             null: false
      t.string :building
      t.string :phone,              null: false
      t.timestamps
    end
  end
end
