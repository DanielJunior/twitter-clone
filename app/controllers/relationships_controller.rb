class RelationshipsController < ApplicationController

  def index
    @facade = RelationshipFacade.new(current_user).user_list_for params[:type]
    render 'users/list'
  end

  def create
    user = User.find(params[:id])
    current_user.follow user
    redirect_to relationships_path(type: Relationship::FOLLOWING)
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfollow user
    redirect_to relationships_path(type: Relationship::FOLLOWING)
  end
end
