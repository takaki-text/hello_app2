class RemoveDeletedAtFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :deleted_at, :datetime
  end
end
