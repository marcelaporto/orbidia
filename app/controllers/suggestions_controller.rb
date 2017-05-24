get '/getsongs' do
  @languages = Language.order(:name)
  @genres = Genre.all
  erb :'_suggestionform'
end

get '/showsongs' do
  @user = User.find(session[:user_id])
  @countries = CountriesLanguage.get_countries(params[:language], @user.country.name)
  @genre = params[:genre]
  tracks_array = []
  @countries.each do |market|
    tracks_array << SongAdapter.new.get_songs(market, @genre)
    tracks_array.flatten!
  end

  @tracks = tracks_array.sample(4)

  @languages = Language.order(:name)
  @genres = Genre.all
  erb :'getsongs'
end
