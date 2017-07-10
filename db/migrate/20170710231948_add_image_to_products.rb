class AddImageToProducts < ActiveRecord::Migration[5.1]
  def up
  add_attachment :products, :image_file
  end

  def down
    remove_attachment :products, :image_file
  end
end
