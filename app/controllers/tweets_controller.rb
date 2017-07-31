class TweetsController < ApplicationController

  def create
    Tweet.create(tweet_params)
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit!
  end
end
