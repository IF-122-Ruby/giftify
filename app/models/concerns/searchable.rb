module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    mapping do
      indexes :first_name,  analyzer: 'english'
      indexes :last_name,  analyzer: 'english'
      indexes :name,  analyzer: 'english'
      indexes :description,  analyzer: 'english'
    end

    def self.search(query)
      __elasticsearch__.search(
        {
          query: {
            multi_match: {
              query: query,
              fields: ['first_name', 'last_name', 'name', 'description']
            }
          }
        }
      )
    end
  end
end