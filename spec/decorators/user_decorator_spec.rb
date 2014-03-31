require 'spec_helper'

describe UserDecorator do
  describe "#formatted_followed_count" do
    before do
      @user = FactoryGirl.create(:user)
      1000.times do
        other_user = FactoryGirl.create(:user)
        @user.follow!(other_user)
      end
    end

    it "returns a number with a comma" do
      expect(@user.decorate.formatted_followed_count).to eq("1,000")
    end
  end

  describe "#formatted_followers_count" do
    before do
      @user = FactoryGirl.create(:user)
      1000.times do
        other_user = FactoryGirl.create(:user)
        other_user.follow!(@user)
      end
    end

    it "returns a number with a comma" do
      expect(@user.decorate.formatted_followers_count).to eq("1,000")
    end
  end
end
