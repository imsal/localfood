class AddProfileInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    # add_column :users, :account_type, :integer, null: false, default: 0 ### will verify account types through cancancan

    # all accounts types (business / customer / admin)
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :street_address, :string
    add_column :users, :suite, :string
    add_column :users, :city, :string
    add_column :users, :state, :integer
    add_column :users, :zip_code, :string

    # business only
    add_column :users, :business_name, :string
    add_column :users, :food_category, :string
    add_column :users, :notes, :text
  end
end
