class TweetFacade
  attr_reader :current_user
  attr_accessor :user

  def initialize current_user, user_id
    @current_user = current_user
    @user = User.find_by_id(user_id)
  end

  def tweets
    @tweets = @user.tweets.order("created_at DESC") unless @user.blank?
  end

  def title
    !@user.blank? && (@user.id != @current_user.id) ? "Tweets from #{@user.name}" : "My tweets:"
  end

  def errors
    @user.blank? ? {"User": ["not found!"]} : nil
  end
end