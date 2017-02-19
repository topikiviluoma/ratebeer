class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.text :description
      t.integer :beer_id

      t.timestamps null: false
    end
    remove_column :beers, :style
    add_reference :beers, :style
    add_foreign_key :beers, :style

  end
end
