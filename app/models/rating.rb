class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :brew
  # attr_accessible :title, :body
end
