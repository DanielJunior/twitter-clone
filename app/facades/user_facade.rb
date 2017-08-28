class UserFacade < DefaultFacade

  attr_accessor :user

  def initialize current_user, user_id
    super current_user
    @user = User.find_by_id(user_id)
  end
end