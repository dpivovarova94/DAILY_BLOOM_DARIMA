class RemoveCreatedDateFromChallenges < ActiveRecord::Migration[7.0]
  def change
    remove_column :challenges, :created_date, :date
  end
end
