get '/getsongs' do
  erb :'suggestionform'
end

post '/getsongs' do
  @user = User.find(session[:user_id])
  @countries = CountriesLanguage.get_countries(params[:language], @user.country.name)
  @genre = params[:genre]
end

get '/showsongs' do

end
