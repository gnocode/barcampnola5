class Account < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :entries

  attr_accessible :email
  attr_accessible :name
  attr_accessible :provider
  attr_accessible :uid

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      # user.oauth_token = auth.credentials.token
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
