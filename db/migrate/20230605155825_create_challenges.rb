class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.references :keyword, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :created_date
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
