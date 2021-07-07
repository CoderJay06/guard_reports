# frozen_string_literal: true

module GuardHelpers
  def sign_in_user(user)
    session[:guard_id] = user.id
  end

  def create_new_user(user)
    user.name = params[:name]
    user.email = params[:email]
    user.number = params[:number]
    user.password = params[:password]
    user.company = params[:company]
    user.save
  end
end
