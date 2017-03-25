helpers do
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    current_user ? true : false
  end

  def login(user)
    session[:user_id] = user.id
    puts "user: #{user}"
    puts "user.id: #{user.id}"
    puts "session[:user_id]: #{session[:user_id]}"
  end

  def logout
    session.clear
  end
end
