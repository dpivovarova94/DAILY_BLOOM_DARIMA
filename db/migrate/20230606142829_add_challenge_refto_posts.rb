class AddChallengeReftoPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :challenge, foreign_key: true
  end
end
