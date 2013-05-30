#fetch all users
#get ratings for each user

#for each rating, check to see if the brew_id and value match any of the original users ratings
#if a rating does match, add a point

#sort the users by how many points they scored during the matching

#grab the ranked users and iterate through them, collecting the brew_ids of brews they have liked that the original user hasn't tried

#look up the top 5 recommended brews in the database by the id and collect and return them.

class Recommendation
  attr_reader :original_user

  def initialize(original_user)
    @original_user = original_user
  end

  def self.for(user)
    new(user).serve_recommendations
  end

  def ranked_users
    @ranked_users ||= rank_by_similar_ratings
  end

  def rank_by_similar_ratings
    tallied_users = []
    peers.each do |user|
      total = tally_points(user)
      tallied_users.insert(total, user)
    end
    tallied_users.compact.reverse
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

  def peers
    @peers ||= original_user.peers
  end

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
end
