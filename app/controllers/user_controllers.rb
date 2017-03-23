get '/' do
  @user = User.all
  erb :'home'
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :'user/index'
end
