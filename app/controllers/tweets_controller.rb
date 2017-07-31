class TweetsController < ApplicationController

  def create
    t = Tweet.create(tweet_params)
    if t.errors.any?
      flash[:errors] = t.errors.messages
    end
    redirect_to root_path
  end

  def update
    t = Tweet.find(params[:id])
    if !t.update_attributes(tweet_params)
      flash[:errors] = t.errors.messages
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
