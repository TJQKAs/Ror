module SessionsHelper
  # logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # returns logged in user
 def current_user
 #   if @current_user.nil?
 #  # in case we'haven't yet current user, we  grab data from cookie in browser and find user by id
 #   @current_user =  User.find_by(id: session[:user_id])
 # else
 #   @current_user
 # end
  @current_user ||= User.find_by(id: session[:user_id])
 end

 # return true if we have user else false
  def logged_in?
  !current_user.nil?
  end

end
