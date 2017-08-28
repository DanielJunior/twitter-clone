class UsersController < ApplicationController
  def index
    @facade = UserDashboardFacade.new current_user
    flash[:errors] = @facade.errors
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def search
    @facade = UsersList.facade_for "search", current_user, params[:q]
    render 'users/list'
  end
end
