class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def movements?
    return true
  end

  def dashboard?
    record.user == user
  end
end
