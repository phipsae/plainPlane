class PlaneModel < ApplicationRecord
  has_many :planes

  validates :seats, :horsepower, :name, presence: true
end
