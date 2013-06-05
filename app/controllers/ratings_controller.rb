class RatingsController < ApplicationController
  before_filter :require_login

  def index
    @brews = Brew.page(params[:page])
  end

  def create
    rating = Rating.find_or_initialize_by_user_id_and_brew_id(user_id: current_user.id, brew_id: params[:brew_id])
    rating.update_attributes(user_id: current_user.id, brew_id: params[:brew_id], rating: params[:rating])
    redirect_to ratings_path, alert: 'Brew Rated!'
  end

  def destroy
    rating = Rating.where(user_id: current_user.id).where(brew_id: params[:id]).limit(1).first
    Rating.destroy(rating.id) if rating
    redirect_to ratings_path
  end
end
