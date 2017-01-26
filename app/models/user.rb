class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable, :omniauthable, :trackable, :timeoutable, :validatable,
         :confirmable, :recoverable, :rememberable, :stretches => 20, :omniauth_providers => [:google_oauth2]

  enum role: { admin: 0, member: 1 }

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email    = auth.info.email
      user.name     = auth.info.name
      user.provider = auth.provider
      user.uid      = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.role     = User.roles[:member]
    end
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name     = auth.info.nickname
      user.provider = auth.provider
      user.uid      = auth.uid
      user.email    = User.create_unique_email
      user.password = Devise.friendly_token[0,20]
      user.role     = User.roles[:member]
    end
  end

  def self.find_for_google_oauth(auth, signed_in_resource = nil)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name     = auth.info.name
      user.provider = auth.provider
      user.uid      = auth.uid
      user.email    = auth.info.email
      user.token    = auth.credentials.token
      user.password = Devise.friendly_token[0,20]
      user.role     = User.roles[:member]
    end
  end

  # 通常サインアップ時のuid用、Twitter OAuth認証時のemail用にuuidな文字列を生成
  def self.create_unique_string
    SecureRandom.uuid
  end

  # twitterではemailを取得できないので、適当に一意のemailを生成
  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end
end
