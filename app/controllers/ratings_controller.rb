class RatingsController < ApplicationController
  before_filter :require_login

  def create
    Rating.create(user_id: current_user.id, brew_id: params[:brew_id], rating: params[:rating])
    redirect_to root_path
  end

  def update
    rating = Rating.where(user_id: current_user.id).where(brew_id: params[:brew_id]).limit(1).first
    rating.update_attributes(rating: params[:rating])
    redirect_to root_path
  end

  def destroy
    rating = Rating.where(user_id: current_user.id).where(brew_id: params[:id]).limit(1).first
    Rating.destroy(rating.id)
    redirect_to root_path
  end
end
