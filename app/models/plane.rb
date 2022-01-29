class Plane < ApplicationRecord
  belongs_to :plane_model
  belongs_to :user
  has_many :bookings
end
