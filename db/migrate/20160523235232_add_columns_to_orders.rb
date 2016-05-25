class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :product_id, :integer
    add_column :orders, :subtotal, :float
    add_column :orders, :tax, :float
    add_column :orders, :total, :float
  end
end