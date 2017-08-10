class UserDashboardFacade
  attr_reader :user

  def initialize current_user
    @user = current_user
  end

  def my_feed
    @my_feed ||= user.feed.desc
  end

  def new_tweet
    @tweet = Tweet.new
  end
end