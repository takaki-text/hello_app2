class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
