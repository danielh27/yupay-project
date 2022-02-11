class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(warehouse: user.warehouses.first)
    end
  end

  def create?
    return true
  end

  def show?
    record.warehouse.user == user
  end

  def update?
    record.warehouse.user == user
  end

  def edit?
    record.warehouse.user == user
  end
end
