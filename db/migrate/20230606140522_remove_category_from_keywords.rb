class RemoveCategoryFromKeywords < ActiveRecord::Migration[7.0]
  def change
    remove_column :keywords, :category, :string
  end
end
