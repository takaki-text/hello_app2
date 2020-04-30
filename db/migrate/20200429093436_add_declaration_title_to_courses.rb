class AddDeclarationTitleToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :title, :string
  end
end
