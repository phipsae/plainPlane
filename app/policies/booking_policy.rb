class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all  # where(user: user) # @record.plane.user
    end
  end

  def create?
    user
  end
end
