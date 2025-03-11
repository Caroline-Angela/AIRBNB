class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :images  # Allow multiple images
  geocoded_by :address # Assumes you have an `address` column
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :image
end
