class Plane < ApplicationRecord
  belongs_to :plane_model
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
end
