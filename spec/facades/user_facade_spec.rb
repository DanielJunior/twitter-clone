require 'rails_helper'

describe UserFacade do

  before do
    @user = FactoryGirl.create(:user)
    @facade = UserFacade.new @user, nil
  end

  describe '.my_tweets' do
    it {expect(@facade.my_tweets).to eq(@user.tweets)}
  end

  describe '.new_tweet' do
    it {expect(@facade.new_tweet).to be_a(Tweet)}
  end


end