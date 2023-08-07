class Challenge < ApplicationRecord
  belongs_to :keyword
  belongs_to :user
  has_one :post
  validates :keyword_id, presence: true
  validates :user_id, presence: true
end
