class User < ActiveRecord::Base
  def self.find_or_create_from_oauth(hash)
    user = self.find_by_info(hash.info) || self.create_by_info(hash.info)
    user.set_credentials(hash.credentials)
    user
  end

  def self.find_by_info(params={})
    User.where(email: params["email"]).first
  end

  def self.create_by_info(params={})
    User.create(email: params["email"],name: params["name"])
  end

  def set_credentials(credentials={})
    self.access_token = credentials["token"]
    self.refresh_token =  credentials["refresh_token"]
  end
end
