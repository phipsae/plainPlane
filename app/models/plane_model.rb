class PlaneModel < ApplicationRecord
  has_many :planes, dependent: :destroy

  validates :seats, :horsepower, :name, presence: true
end
