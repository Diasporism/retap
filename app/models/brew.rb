class Brew < ActiveRecord::Base
  attr_accessible :bid, :name, :brewery, :med_image_url, :large_image_url

  has_many :ratings
end
