get '/register' do
  @countries = Country.order(:name)
  @languages = Language.order(:name)
  erb :'user/new'
end

post '/register' do
  @user = User.new(full_name: params[:user][:full_name], email: params[:user][:email], password: params[:user][:password], country: Country.find_by(name: params[:user][:country]))
  login(@user)

  @image = @user.get_gravatar(@user.email)
  redirect "/user/#{@user.id}"
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    login(@user)
    @image = @user.get_gravatar(@user.email)
    redirect "/user/#{@user.id}"
  else
    # @error
    redirect '/'
  end

end

delete '/logout' do

end
