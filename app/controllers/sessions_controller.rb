get '/register' do
  @countries = Country.order(:name)
  @languages = Language.order(:name)
  @moods = Mood.all
  erb :'user/new'
end

post '/register' do
@user = User.new(full_name: params[:user][:full_name], email: params[:user][:email], password: params[:user][:password], country: Country.find_by(name: params[:user][:country]))
p "*" * 30
p @user
p params[:preference]
p "*" * 30
# params[:preferable].each_with_index do |index, thing|
# Preference.new(user: @user, preferable: thing)
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
