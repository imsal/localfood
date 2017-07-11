=begin
class RenamePasswordDigestc < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :password_digestc, :password_digest
  end
end
=end
