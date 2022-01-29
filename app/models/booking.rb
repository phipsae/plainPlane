class Booking < ApplicationRecord
  belongs_to :plane
  belongs_to :user

  enum status: { pending: 0, confirmed: 1, declined: 2 , accepted: 3, cancelled: 4, paid: 5 }
end
