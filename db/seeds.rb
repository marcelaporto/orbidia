

# Basic Genres
#  Stretch => Add 3 country specific genres
Genre.destroy_all
User.destroy_all
Mood.destroy_all
Country.destroy_all

array_name = ["Blues", "Classical", "Country", "Jazz", "Reggae", "Rock", "Children's", "Eletronic", "Pop", "Traditional"]
array_name.each do |name|
    Genre.create(genre: name)
end

# Activities
Mood.create(activity: "101")
Mood.create(activity: "Commute")
Mood.create(activity: "Party")
Mood.create(activity: "Chill")

# Countries
all_countries = IsoCountryCodes.for_select


all_countries.each do |country_arr|
  Country.create(name: country_arr.first, iso_id: country_arr.last)
end

# Users
5.times do
  User.create(full_name: Faker::Name.name, email: Faker::Internet.email, password: 'password', country_id: Country.all.sample.id, language: 'English' )
end

# Languages
all_languages = LanguageList::COMMON_LANGUAGES

all_languages.each do |language|
  Language.create(name: language.name)
end
