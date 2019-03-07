class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :product, index: true
    end
  end
end
