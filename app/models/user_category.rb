class UserCategory < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # line below added
  # has_many :keywords, through: :category
end
