class UsersController < ApplicationController
  def index
    @dashboard = UserFacade.new current_user, "my_tweets"
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @users = User.find_by_fuzzy_name(params[:q])
  end
end
