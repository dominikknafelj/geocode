class Place < ApplicationRecord
  def self.create_from_lookup(lookup_result)
    create(address:   lookup_result.formatted_address,
           longitude: lookup_result.lng,
           latitude:  lookup_result.lat)
  end
end
