class UsersController < ApplicationController
  def index
    @facade = UserDashboardFacade.new current_user
    flash[:errors] = @facade.errors
  end

  def show
    @facade = UserFacade.new current_user, params[:id]
  end

  def search
    @facade = UsersList.facade_for "search", current_user, params[:q]
    render 'users/list'
  end
end
