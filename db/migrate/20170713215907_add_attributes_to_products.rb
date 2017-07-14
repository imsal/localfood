class AddAttributesToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :temperature_requirements, :string
    add_column :products, :shelf_life_in_days, :integer
    add_column :products, :max_hours_of_survival_in_transit, :integer
    add_column :products, :min_num_of_qty_per_purchase, :integer
    add_column :products, :max_num_of_qty_per_purchase, :integer
    add_column :products, :packaging_requirements, :string
    add_column :products, :federal_and_state_shipping_laws, :string
    add_column :products, :frozen_cold_room_temp_or_hot, :string
    add_column :products, :flavor_tags, :string
    add_column :products, :food_type_tags, :string
    add_column :products, :external_model_number, :string
    add_column :products, :slug, :string
  end
end
