class AddStartDateToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :start_date, :date
  end
end
