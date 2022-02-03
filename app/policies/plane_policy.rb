class PlanePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(availability: true)
    end
  end

  def create?
    user
  end

  def show?
    true
  end

  def update?
    record.user == user
  end
end
