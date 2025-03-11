class Review < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :comment, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, in: 1..5 }
end

