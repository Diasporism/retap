class BrewsController < ApplicationController
  before_filter :require_login

  def index
    @recommended_brews = Brew.all[0..4]
    #@recommended_brews = Recommendation.for(current_user)[0..4]
    @brews = Brew.all[0..4]
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
