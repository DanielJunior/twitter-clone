class UsersController < ApplicationController
  def index
    @dashboard = UserDashboardFacade.new current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @facade = UsersList.facade_for "search", current_user.id, params[:q]
    render 'users/list'
  end

  def followers
    @facade = UsersList.facade_for "followers", params[:id]
    render 'users/list'
  end

  def following
    @facade = UsersList.facade_for "following", params[:id]
    render 'users/list'
  end

  def follow
    user = User.find(params[:id])
    current_user.follow user
    redirect_to following_user_url current_user
  end

  def unfollow
    user = User.find(params[:id])
    current_user.unfollow user
    redirect_to following_user_url current_user
  end
end
