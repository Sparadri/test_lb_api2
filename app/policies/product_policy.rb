class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.nil? ? scope.where(is_live: true) : scope.all
    end
  end

  def create?
    user_logged?
  end

  def update?
    user_logged?
  end

  private

  def user_logged?
    user.nil? ? false : true
  end
end
