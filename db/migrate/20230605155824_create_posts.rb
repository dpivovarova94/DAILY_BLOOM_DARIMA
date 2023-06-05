class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.date :date
      t.string :song_url
      t.text :poem
      t.text :text
      t.string :picture_url
      t.string :medium

      t.timestamps
    end
  end
end
