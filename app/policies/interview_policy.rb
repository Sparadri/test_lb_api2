class InterviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
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
