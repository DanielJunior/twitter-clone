class UserDashboardFacade < DefaultFacade
  attr_reader :current_user

  def initialize current_user
    super current_user
  end

  def my_feed
    @my_feed ||= Tweet.feed current_user
  end

  def new_tweet
    @tweet = Tweet.new
  end

  def errors
    nil
  end
end