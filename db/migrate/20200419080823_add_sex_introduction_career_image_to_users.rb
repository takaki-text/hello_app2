class AddSexIntroductionCareerImageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :career, :text
  end
end
