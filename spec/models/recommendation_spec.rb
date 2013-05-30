require 'spec_helper'

describe Recommendation do

  let(:user1)  { User.create(provider: 'facebook', uid: '112233', name: 'Logan Sears') }
  let(:user2)  { User.create(provider: 'facebook', uid: '123456', name: 'Allison Larson') }
  let(:user3)  { User.create(provider: 'facebook', uid: '654321', name: 'Travis Nelson') }
  let(:user4)  { User.create(provider: 'facebook', uid: '654321', name: 'Guy with Bad Taste') }

  let!(:brew1) { Brew.create(bid: 'tmEthz', name: '\"Admiral\" Stache', brewery: 'Milwaukee Brewing Company') }
  let!(:brew2) { Brew.create(bid: 'Pgm9vR', name: '\"Bedraggled\" Irish Red', brewery: 'Dirty Bucket Brewing Company') }
  let!(:brew3) { Brew.create(bid: 'aQLUcl', name: '\"Ptarmigan\" Pilsner', brewery: 'Backcountry Brewery') }
  let!(:brew4) { Brew.create(bid: 'y6cgTK', name: '\"Wheeler\" Wheat', brewery: 'Backcountry Brewery') }
  let!(:brew5) { Brew.create(bid: 'hB0QeO', name: '#9', brewery: 'Magic Hat Brewing Company') }
  let!(:brew6) { Brew.create(bid: 'EPLPz5', name: "'n Toeback", brewery: 'Scheldebrouwerij') }
  let!(:brew7) { Brew.create(bid: 'IkRF2B', name: "'Nother Day in Paradise", brewery: 'NoDa Brewing Company') }
  let!(:brew8) { Brew.create(bid: 'tciJOF', name: '(512) ALT', brewery: '(512) Brewing Company') }
  let!(:brew9) { Brew.create(bid: '6PPnT2', name: '(512) Black IPA', brewery: '(512) Brewing Company') }

  before :each do
    #Myself
    Rating.create(user_id: user1.id, brew_id: 1, rating: true)
    Rating.create(user_id: user1.id, brew_id: 2, rating: true)
    Rating.create(user_id: user1.id, brew_id: 3, rating: true)

    #Allison, who doesn't quite match my taste
    Rating.create(user_id: user2.id, brew_id: 1, rating: false)
    Rating.create(user_id: user2.id, brew_id: 2, rating: true)
    Rating.create(user_id: user2.id, brew_id: 3, rating: true)
    Rating.create(user_id: user2.id, brew_id: 7, rating: true)

    #Travis, who matches my taste very well
    Rating.create(user_id: user3.id, brew_id: 1, rating: true)
    Rating.create(user_id: user3.id, brew_id: 2, rating: true)
    Rating.create(user_id: user3.id, brew_id: 3, rating: true)
    Rating.create(user_id: user3.id, brew_id: 8, rating: true)

    #Some guy, who doesn't match my taste at all
    Rating.create(user_id: user4.id, brew_id: 1, rating: false)
    Rating.create(user_id: user4.id, brew_id: 2, rating: false)
    Rating.create(user_id: user4.id, brew_id: 3, rating: false)
    Rating.create(user_id: user4.id, brew_id: 9, rating: false)
  end

  it 'serves beer recommendations based on other users with similar taste' do
    recommendations = Recommendation.for(user1)
    expect(recommendations).to eq [brew8, brew7]
  end
end