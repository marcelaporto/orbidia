get '/register' do
  @countries = Country.all
  @languages = Language.all
  @moods = Mood.all
  erb :'user/new'
end

post '/register' do
# FIRST DRAFT OF REGISTER
# @user = User.new(params[:user])
# params[:preferable].each_with_index do |index, thing|
#   Preference.new(user: @user, preferable: thing)
# end
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
