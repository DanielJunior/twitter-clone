class RelationshipService

  def self.follow current_user, following_id
    following = User.find(following_id)
    current_user.follow following
    "Waiting for #{following.name} accepts your request!"
  end

  def self.unfollow current_user, following_id
    following = User.find(following_id)
    current_user.unfollow following
    "You stop to follow #{following.name}!"
  end

  def self.update id, action
    @relationship = Relationship.find(id)
    @relationship.notification.toggle_active!
    @relationship.perform_action action
    message_for_action @relationship.follower, action
  end

  private
  def self.message_for_action follower, action
    case action
      when Relationship::ACCEPT
        "#{follower.name} now is your follower!"
      else
        "#{follower.name} request to follow you was deleted!"
    end
  end

end