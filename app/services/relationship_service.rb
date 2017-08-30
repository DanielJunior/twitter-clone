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

  def self.update id
    @relationship = Relationship.find(id)
    @relationship.accept
    @relationship.notification.toggle_active!
    "#{@relationship.follower.name} now is your follower!"
  end

end