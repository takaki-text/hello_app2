class AddDeclarationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :declaration, :text
  end
end
