class BreweryDB

  def self.fetch_beer_details(beer_id)
    payload = RestClient.get "http://api.brewerydb.com/v2/beer/#{beer_id}?key=#{ENV['BREWERY_DB_KEY']}"
    JSON.parse(payload)
  end

end