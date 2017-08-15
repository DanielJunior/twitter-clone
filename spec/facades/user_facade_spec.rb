require 'rails_helper'

describe UserDashboardFacade do

  before do
    @user = FactoryGirl.create(:user)
    @facade = UserDashboardFacade.new @user
  end

  describe '.my_feed' do
    it {expect(@facade.my_feed).to match_array(@user.feed)}
  end

  describe '.new_tweet' do
    it {expect(@facade.new_tweet).to be_a(Tweet)}
  end


end