#saves beer data from brewerydb into my my database

x = 1
while x <= 10 do
  beer_request = RestClient.get "http://api.brewerydb.com/v2/beers?key=#{ENV['BREWERY_DB_KEY']}&status=verified&p=#{x}"
  beer_listing = JSON.parse(beer_request)
  beers = beer_listing['data']

  beers.each do |beer|
    Beer.create(bid: beer['id'], name: beer['name'])
  end
  puts x
  x += 1
end
