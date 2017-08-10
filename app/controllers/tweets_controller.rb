class TweetsController < ApplicationController
  load_and_authorize_resource

  def index
    @facade = TweetFacade.new current_user, params[:user_id]
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.errors.any?
      flash[:errors] = @tweet.errors.messages
    end
    redirect_to root_path
  end

  def update
    @tweet = Tweet.find(params[:id])
    if !@tweet.update_attributes(tweet_params)
      flash[:errors] = @tweet.errors.messages
    end
    redirect_to users_path
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
