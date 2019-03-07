class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_command
      t.string 'product_list', array: true
      t.belongs_to :cart
    end
    add_index :orders, :product_list, using: 'gin'

  end
end
