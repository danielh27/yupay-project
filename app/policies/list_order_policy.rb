class ListOrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    return true
  end

  # private

  # def user_is_owner?
  #   # user = current user
  #   # @purchase = record
  #   user == record.user
  # end
end
