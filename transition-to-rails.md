# Transitioning Orbidia to Rails

1. `rails new orbidia --database=postgresql`

2. Database
- User
string: full_name
string: email
string: hashed_password
references: country

- Countries
string: name
string: spotify_iso_id

- Languages
string: name

- CountriesLanguages(join table)
integer: country_id
integer: language_id
s
- Seed file with Spotify's genres + some users

3. Rake Task
[I should do a gem with my rake task]

```desc "Populates country and language table"
task :populate_country_languages do
    uri = URI.parse("https://raw.githubusercontent.com/mledoze/countries/master/countries.json")
    res = Net::HTTP.get_response(uri)
    result = res.body

    all_countries_hash = JSON.parse(result)

    all_countries_hash.each do |country|
      new_country = Country.create(name:country["name"]["common"] , spotify_iso_id: country["cca2"])
      country["languages"].each do |initials, language|

        language = Language.find_or_create_by(name: language)
        new_country.languages << language unless new_country.languages.include?(language)

      end
    end
end
```

Be sure the above rake task makes sense w/ rails.

4. Models
  4.1 Active Record Associations
    * User: `belongs_to :country, class_name: "Country"`
    * Country: `has_many :countries_languages
                has_many :languages, through: :countries_languages
                has_many :users`
    * Language: `has_many :countries_languages
                 has_many :countries, through: :countries_languages`
    * CountriesLanguage: `belongs_to :country
                          belongs_to :language`
    4.2 Logic
      * User: `sessions/authenticate`
      * CountriesLanguage: `self.get_countries`


5. Controllers
  * sessions_controller
    - login
    - logout
  * users_controller
    - New user => incorporate from sessions_controller (sinatra)
    - Delete user
    - Homepage for user (with suggestions) => incorporate suggestions_controller into users_controller

    5.1 ROUTING!!! **sessions_controller#create is '/'**

6. Views

  * layout
  * home (have login)
  * register
    * `_suggestionform.erb`
  * User homepage (hardest part: show his preferences + suggestions)

7. API
Model: SongAdapter

How does API work with rails again?

Old code:

```  class SongAdapter

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
```

8. Finishing MVP

- Show up recommendations in stylishly in user page
- Errors

9. Styling

10. Expanding

You can add similar artists
Each 'suggestion' can be voted up/down
