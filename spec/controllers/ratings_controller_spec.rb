require 'spec_helper'

describe RatingsController do
  let(:valid_attributes) { { user_id: 1, brew_id: 1, rating: true } }
  let(:user) { User.create(id: 1, provider: 'facebook', uid: '112233', name: 'Logan Sears') }

  before :each do
    controller.stub(:require_login).and_return(true)
    controller.auto_login(user)
  end

  describe 'POST create' do
    it 'creates a new Rating' do
      expect {
        post :create, valid_attributes
      }.to change(Rating, :count).by(1)
    end

    it 'redirects to the brew_index' do
      post :create, valid_attributes
      response.should redirect_to(ratings_path)
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested rating' do
      rating = Rating.create! valid_attributes
      expect {
        delete :destroy, {id: rating.id}
      }.to change(Rating, :count).by(-1)
    end

    it 'redirects to the brew_index' do
      rating = Rating.create! valid_attributes
      delete :destroy, {id: rating.id}
      response.should redirect_to(ratings_path)
    end
  end
end
