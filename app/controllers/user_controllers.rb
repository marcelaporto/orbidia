get '/' do
  @user = User.all
  erb :'home'
end

post '/' do

end

get ' /user/:id/set-preferences' do

end

get '/user/:id' do
  @user = User.find(params[:id])
end
