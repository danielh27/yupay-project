class ListPurchasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:purchase).where(purchase: { user: user })
    end
  end

  def create?
    return true
  end

  def destroy?
    record.purchase.user == user
  end
end
