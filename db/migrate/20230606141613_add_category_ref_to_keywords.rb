class AddCategoryRefToKeywords < ActiveRecord::Migration[7.0]
  def change
    add_reference :keywords, :category, foreign_key: true
  end
end
