require 'spec_helper'

describe User do
  describe :new_from_oauth do
    let(:oauth_hash) do
      obj = Object.new
      obj.stub(:info => {"email" => "test@example.com", "name" => "John Smith"}, 
                      :credentials => {"token" => "A123", "refresh_token" => "B1234"})
      obj
    end

    it "should create a new User instance" do
      user = User.new_from_oauth(oauth_hash)
      user.should be_instance_of(User)
    end
  end
end
