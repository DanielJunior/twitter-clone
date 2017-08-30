class RelationshipsController < ApplicationController

  def index
    @facade = RelationshipFacade.new(current_user).user_list_for params[:type]
    render 'users/list'
  end

  def create
    message = RelationshipService.follow current_user, params[:following_id]
    flash[:notice] = message
    redirect_to relationships_path(type: Relationship::FOLLOWING)
  end

  def destroy
    message = RelationshipService.unfollow current_user, params[:following_id]
    flash[:notice] = message
    redirect_to relationships_path(type: Relationship::FOLLOWING)
  end

  def update
    message = RelationshipService.update params[:id], params[:type]
    flash[:notice] = message
    redirect_to relationships_path(type: Relationship::FOLLOWERS)
  end
end
