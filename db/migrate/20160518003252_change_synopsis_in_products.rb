class ChangeSynopsisInProducts < ActiveRecord::Migration
  def change
    change_table :products do
      change_column :products, :synopsis, :text
    end
  end
end
