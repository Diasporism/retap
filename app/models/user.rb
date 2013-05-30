class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid

  has_many :ratings

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def peers
    User.where(['users.id <> ?', id])
  end

end
