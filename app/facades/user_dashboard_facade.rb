class UserDashboardFacade
  attr_reader :current_user

  def initialize current_user
    @current_user = current_user
  end

  def my_feed
    @my_feed ||= current_user.feed.desc
  end

  def new_tweet
    @tweet = Tweet.new
  end

  def errors
    nil
  end
end