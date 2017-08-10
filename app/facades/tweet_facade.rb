class TweetFacade
  attr_reader :user
  attr_reader :tweets

  def initialize current_user, user_id
    @user = current_user
    @tweets = Tweet.where(user_id: user_id)
    @tweet_owner = @tweets.first.user unless @tweets.blank?
  end

  def title
    !@tweet_owner.blank? && (@tweet_owner.id != @user.id) ? "Tweets from #{@tweet_owner.name}" : "My tweets:"
  end
end