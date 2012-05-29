class User < ActiveRecord::Base
  def self.new_from_oauth hash
    obj = User.new
    obj.email = hash.info["email"]
    obj.name = hash.info["name"]
    obj.access_token = hash.credentials["token"]
    obj.refresh_token =  hash.credentials["refresh_token"]
    obj
  end
end
