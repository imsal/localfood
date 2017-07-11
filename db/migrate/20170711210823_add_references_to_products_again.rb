class AddReferencesToProductsAgain < ActiveRecord::Migration[5.1]
  def change
    remove_reference :products, :user
    add_reference :products, :user, foreign_key: true
  end
end
