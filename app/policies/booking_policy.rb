class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)   # @record.plane.user
    end
  end
end
