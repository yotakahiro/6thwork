class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :order_id
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
