class Booking < ApplicationRecord
  belongs_to :plane
  belongs_to :user

  enum status: { pending: 0, confirmed: 1, declined: 2, accepted: 3, cancelled: 4, paid: 5 }
  # validates :end_date, comparison: { greater_than_or_equal_to: :start_date }

  validates :status, :start_date, :end_date, presence: true
end
