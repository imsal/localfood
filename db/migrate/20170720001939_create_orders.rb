class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :street_address
      t.string :suite
      t.string :city
      t.integer :state
      t.string :zip_code
      t.string :email
      t.integer :pay_type
      t.integer :status

      t.decimal :final_total, precision: 8, scale: 2

      t.timestamps
    end
  end
end
