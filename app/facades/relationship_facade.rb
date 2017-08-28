class RelationshipFacade < DefaultFacade

  def initialize current_user
    super current_user
  end

  def user_list_for type
    RELATIONSHIPS[type.to_i].call(current_user)
  end

  private
  def self.followers user
    UsersList.facade_for("followers", user)
  end

  def self.following user
    UsersList.facade_for("following", user)
  end

  RELATIONSHIPS = {
      Relationship::FOLLOWERS => lambda {|user| followers user},
      Relationship::FOLLOWING => lambda {|user| following user}
  }
end