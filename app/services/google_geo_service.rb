module GoogleGeoService
  def self.look_up_address(query='')
    return nil if query.empty?
    client = GooglePlaces::Client.new(ENV['google_places_api_key'])
    client.spots_by_query(query).first
  end
end
