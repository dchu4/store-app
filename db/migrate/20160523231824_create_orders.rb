class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
