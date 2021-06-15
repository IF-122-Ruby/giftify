module Searchable
  extend ActiveSupport::Concern

  included do
    def self.search(query)

    end

    def search_data
      {
        name: name,
        price: price,
      }
    end
  end
end