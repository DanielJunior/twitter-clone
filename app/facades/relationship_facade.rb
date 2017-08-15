class RelationshipFacade
  attr_reader :user

  def initialize current_user
    @user = current_user
  end

  def user_list_for type
    RELATIONSHIPS[type.to_i].call(user.id)
  end

  private
  def self.followers user_id
    UsersList.facade_for("followers", user_id)
  end

  def self.following user_id
    UsersList.facade_for("following", user_id)
  end

  RELATIONSHIPS = {
      Relationship::FOLLOWERS => lambda {|user_id| followers user_id},
      Relationship::FOLLOWING => lambda {|user_id| following user_id}
  }
end