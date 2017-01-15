module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      # create an anonymous scope
      results = self.where(nil)

      filtering_params.each do |key, value|
        results = results.public_send(key.to_sym, value) if value.present?
      end
      results
    end
  end
end
