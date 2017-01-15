class CollectionPolicy < ApplicationPolicy

  class Scope < Scope

    # to do: why going to resolve method?
    # note: scope take the value of the current model > Collection
    def resolve
      user.nil? ? scope.where(is_live: true) : scope.all
    end

  end

  def show?
    record.is_live ? true : user_logged?
  end

  def create?
    user_logged?
  end

  def email?
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
