class TweetsController < ApplicationController
  load_and_authorize_resource

  def index
    @facade = TweetFacade.new current_user, params[:user_id]
  end

  def create
    @tweet = Tweet.create(tweet_params)
    flash[:error] = @tweet.errors.full_messages
    redirect_to tweets_path user_id: @tweet.user
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update_attributes(tweet_params)
    flash[:error] = @tweet.errors.full_messages
    redirect_to tweets_path user_id: @tweet.user
  end

  def destroy
    Tweet.destroy(params[:id])
    redirect_to users_path
  end

  private
  def tweet_params
    params.require(:tweet).permit!
  end
end
