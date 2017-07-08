class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.references :product, foreign_key: true
      t.integer :quantity, default: 1
      t.references :cart, foreign_key: true
      # Add the below later
      # t.integer  "order_id"
      # t.index ["order_id"], name: "index_line_items_on_order_id"
      t.timestamps
    end
  end
end
