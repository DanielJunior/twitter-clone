class UsersController < ApplicationController
  def index
    @dashboard = UserFacade.new current_user, "my_tweets"
  end

  def show
    @user = User.find(params[:id])
  end
end
