class Recommendation
  attr_reader :original_user, :tallied_users
  attr_accessor :ranked_users

  def initialize(original_user)
    @original_user = original_user
    @tallied_users = []
    @ranked_users = []
  end

  def rank_by_similar_ratings(users)
    users.each do |user|
      total = tally_points(user)
      tallied_users.insert(total, user)
    end
    self.ranked_users = Recommendation.order_users_by_points(tallied_users)
  end

  def serve_recommendations
    recommended_brews = []
    ranked_users.each do |user|
      user.ratings.each do |rating|
        recommended_brews << rating.brew_id if !brew_tasted?(rating) && rating.rating == true
      end
    end
    recommended_brews.collect { |r| Brew.find(r) }
  end

  private

  def tally_points(user)
    points = 0
    user.ratings.each { |rating| points += 1 if rating_matches?(rating) }
    points
  end

  def rating_matches?(rating)
    original_user.ratings.any? { |r| r.brew_id == rating.brew_id && r.rating == rating.rating }
  end

  def brew_tasted?(rating)
    original_user.ratings.any? { |r| r.brew_id == rating.brew_id }
  end

  def self.order_users_by_points(users)
    users.compact.reverse
  end

end


#fetch all users
#get ratings for each user

#for each rating, check to see if the beer_id and value match any of the original users ratings
#if a rating does match, add a point

#sort the users by how many points they scored during the matching

#grab the top N ranked users and iterate through them, collecting the beer_ids of beers they have liked that the original user hasn't tried
#stop iterating when the recommended beer list reaches a size of 5

#look up the beers in the database by the id and collect them.
#recommend those beers to the original user