#saves beer data from brewerydb into my database

x = 1
while x <= 10 do
  beer_request = RestClient.get "http://api.brewerydb.com/v2/beers?key=#{ENV['BREWERY_DB_KEY']}&status=verified&p=#{x}&withBreweries=y"
  beer_listing = JSON.parse(beer_request)
  beers = beer_listing['data']

  beers.each do |beer|
    if beer['labels']
      Brew.create(bid: beer['id'], name: beer['name'], brewery: beer['breweries'].first['name'], med_image_url: beer['labels']['medium'], large_image_url: beer['labels']['large'])
    #elsif beer['breweries'].first['images']
    #  Brew.create(bid: beer['id'], name: beer['name'], med_image_url: beer['breweries'].first['images']['medium'], large_image_url: beer['breweries'].first['images']['large'])
    #else
    end
  end
  puts x
  x += 1
end
