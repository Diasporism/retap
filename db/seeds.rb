#saves beer data from brewerydb into my database

x = 1
while x <= 10 do
  beer_request = RestClient.get "http://api.brewerydb.com/v2/beers?key=#{ENV['BREWERY_DB_KEY']}&status=verified&p=#{x}&withBreweries=y"
  beer_listing = JSON.parse(beer_request)
  beers = beer_listing['data']

  beers.each do |beer|
    Brew.create(bid: beer['id'], name: beer['name'], brewery: beer['breweries'].first['name'])
  end
  puts x
  x += 1
end

#Creates users with random beer ratings attached to them

100.times do
  user = User.create(provider: 'facebook', name: 'Jane Doe')
  50.times do
    Rating.create(user_id: user.id, brew_id: rand(1..500), rating: [true, false].sample)
  end
end
