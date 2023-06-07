class Challenge < ApplicationRecord
  belongs_to :keyword
  belongs_to :user
  has_one :post
end
