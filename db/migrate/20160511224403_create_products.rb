class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :synopsis
      t.string :image
      t.decimal :price
      t.integer :quantity
      t.decimal :rating

      t.timestamps null: false
    end
  end
end
