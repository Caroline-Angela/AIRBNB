class Review < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true, length: { minimum: 3 }
end
