module ControllerHelpers
  def login_with(user = double('user'), scope = :user)
    current_user = "current_#{scope}".to_sym
    user.nil? ? non_authenticated_login(scope, current_user) : authenticated_login(user, current_user)
  end

  def authenticated_login user, current_user
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(current_user).and_return(user)
  end

  def non_authenticated_login scope, current_user
    allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => scope})
    allow(controller).to receive(current_user).and_return(nil)
  end

end