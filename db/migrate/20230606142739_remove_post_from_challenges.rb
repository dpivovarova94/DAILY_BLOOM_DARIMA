class RemovePostFromChallenges < ActiveRecord::Migration[7.0]
  def change
    remove_reference :challenges, :post, null: false, foreign_key: true
  end
end
