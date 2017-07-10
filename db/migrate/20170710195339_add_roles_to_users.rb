class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :super_admin_role, :boolean, default: false
    add_column :users, :admin_role, :boolean, default: false
    add_column :users, :business_role, :boolean, default: false
    add_column :users, :customer_role, :boolean, default: true
  end

    # current_user.super_admin_role?
    # current_user.admin_role?
    # current_user.business_role?
    # current_user.customer_role?
end
