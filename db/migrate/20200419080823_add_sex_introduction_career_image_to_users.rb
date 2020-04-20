class AddSexIntroductionCareerImageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sex, :integer
    add_column :users, :introduction, :text 
    add_column :users, :career, :text
    add_column :users, :image, :string
  end
end
