class BrewsController < ApplicationController
  before_filter :require_login

  def index
    @brews = Brew.all
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
