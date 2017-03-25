class SongAdapter

  def initialize
    RSpotify.authenticate(ENV['CLIENT_ID'], ENV["CLIENT_SECRET"])
  end

  def get_songs(country, genre)
    p "*" *30
    p "Country: #{country}"
    p "Genre: #{genre}"
    recommendations = RSpotify::Recommendations.generate(limit: 3, seed_genres: [genre], market: country)
    p "Recomm: #{recommendations.tracks[0]}"
    p "*" *30
    recommendations.tracks
  end

  def get_array_songs
    @user = User.find(session[:user_id])
    @countries = CountriesLanguage.get_countries(params[:language], @user.country.name)

    @genre = params[:genre]
    tracks_array = []

    @countries.each do |market|
      tracks_array << SongAdapter.new.get_songs(market, @genre) if SongAdapter.new.get_songs(market, @genre)
      tracks_array.flatten!
    end

    @tracks = tracks_array.sample(4)
  end
#  Genres has to be in an ARRAY


end
