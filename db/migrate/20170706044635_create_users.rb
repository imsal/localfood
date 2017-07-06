class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      # all account types including admin
      t.integer :account_type, null: false # admin, business, customer
      t.string :name, null: false # client / business contact name
      t.string :phone_number, null:false # clent / business contact phone number
      t.string :email, unique: true, null: false
      t.string :password_digestc

      # business & customer
      t.string :business_name
      t.string :street_address
      t.string :apartment # or suite/unit number for business
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :food_category

      t.timestamps
    end
  end
end
