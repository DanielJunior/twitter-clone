class UsersController < ApplicationController
  def index
    @dashboard = UserDashboardFacade.new current_user
    flash[:errors] = @dashboard.errors
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def search
    @facade = UsersList.facade_for "search", current_user.id, params[:q]
    render 'users/list'
  end
end
