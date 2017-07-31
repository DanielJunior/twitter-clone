class UserFacade
  attr_reader :user
  attr_reader :active_tab

  def initialize current_user, active_tab
    @user = current_user
    @active_tab = active_tab
  end

  def my_tweets
    @my_tweets = user.tweets.desc
  end

  def new_tweet
    @tweet = Tweet.new
  end
end