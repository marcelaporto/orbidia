get '/' do
  @user = User.all
  erb :'home'
end

post '/' do

end
