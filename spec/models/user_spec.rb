require 'spec_helper'

describe User do
  describe :find_by_info do
    context "without params" do
      it "should return nil" do
        User.find_by_info.should be_nil
      end
    end

    context "with user email at params" do
      let(:user) { User.new email: 'user.example' }
      before do
        User.should_receive(:where).and_return([user])
      end
      it "should return nil" do
        User.find_by_info("email" =>'user@example.com').should be user
      end
    end
  end

  describe :create_by_info do
    it "should create new user" do
      lambda {
        User.create_by_info("email" => "user@example.com", "name" => "Foo User" )
      }.should change(User, :count).by(1)
    end
  end

  describe :set_credentials do
    let(:user) { User.new email: 'user.example' }
    before do
      user.access_token.should be_nil
      user.refresh_token.should be_nil
    end
    it "should set user google credentials" do
      user.set_credentials("token" => "abc123", "refresh_token" => "poiu0987")
      user.access_token.should == "abc123"
      user.refresh_token.should == "poiu0987"
    end
  end

  describe :find_or_create_from_oauth do
    let(:oauth_hash) { stub("auth_hash", :info => {}, :credentials => {}) }
    let(:user) { User.new email: 'user.example' }

    context "create new user" do
      before do
        User.should_receive(:find_by_info).and_return(nil)
        User.should_receive(:create_by_info).and_return(user)
      end
      it "should use existing user" do
        User.find_or_create_from_oauth(oauth_hash).should be user
      end
    end

    context "use exists user" do
      before do
        User.should_receive(:find_by_info).and_return(user)
      end
      it "should use existing user" do
        User.find_or_create_from_oauth(oauth_hash).should be user
      end
    end
  end
end
