get '/register' do
  @countries = Country.all
  @languages = Language.all
  erb :'user/new'
end

post '/register' do

end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    login
    redirect "/user/#{@user.id}"
  else
    # @error
    redirect '/'
  end
end

delete '/logout' do

end
