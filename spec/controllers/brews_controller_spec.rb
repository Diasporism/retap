require 'spec_helper'

describe BrewsController do
  let(:valid_attributes) { { bid: 'cBLTUw', name: '18 Imperial IPA' } }

  before :each do
    controller.stub(:require_login).and_return(true)
  end

  describe 'GET index' do
    it 'assigns all brews as @brews' do
      brew = Brew.create! valid_attributes
      get :index
      assigns(:brews).should eq([brew])
    end
  end
end
