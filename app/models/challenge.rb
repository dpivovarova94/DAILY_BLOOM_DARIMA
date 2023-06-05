class Challenge < ApplicationRecord
  belongs_to :keyword
  belongs_to :user
  belongs_to :post
end
