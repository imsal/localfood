class ChangeStateToIntForUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :state
    add_column :users, :state, :integer
  end
end
