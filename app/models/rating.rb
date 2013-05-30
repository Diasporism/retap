class Rating < ActiveRecord::Base
  attr_accessible :user_id, :brew_id, :rating

  belongs_to :user
  belongs_to :brew
end
