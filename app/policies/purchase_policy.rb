class PurchasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def confirm?
    return true
  end

  def show?
    return true
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    # user = current user
    # @purchase = record
    user == record.user
  end
end
