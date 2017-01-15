class CollectionerPolicy < ApplicationPolicy

  class Scope < Scope

    def resolve
      # should be displayed is user not logged at least one collection is live?
      # what behavior when click on colletioner? goes to collections?
      # should return activerecord relation and not an array
      if user_logged?
        scope
      else
        collectioners = []
        scope.each do |collectioner|
          total = 0
          collectioner.collections.each { |coll| total += 1 if coll.is_live }
          collectioners << collectioner if total > 0
        end
        collectioners
      end

    end

    private

    def user_logged?
      user.nil? ? false : true
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
