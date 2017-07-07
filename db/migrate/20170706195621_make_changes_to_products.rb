class MakeChangesToProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :price
    # precision is the amount of digits before the decimal AND scale is the amount of digits after the decimal
    add_column :products, :wholesale_price, :decimal, precision: 8, scale: 2
    add_column :products, :retail_price, :decimal, precision: 8, scale: 2
    add_column :products, :discount_percentage, :decimal, precision: 2, scale: 2
    add_column :products, :discount_expiration_date, :datetime
  end
end
