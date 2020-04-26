class CreateDemands < ActiveRecord::Migration[6.0]
  def change
    create_table :demands do |t|
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
