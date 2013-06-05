class BrewsController < ApplicationController
  before_filter :require_login

  def index
    @recommended_brews = Recommendation.for(current_user)[0..4]
  end

end
