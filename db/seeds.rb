

# Basic Genres
#  Stretch => Add 3 country specific genres
Genre.destroy_all
User.destroy_all
Mood.destroy_all

array_name = ["Blues", "Classical", "Country", "Jazz", "Reggae", "Rock", "Children's", "Eletronic", "Pop", "Traditional"]
array_name.each do |name|
    Genre.create(genre: name)
end

# Activities
Mood.create(activity: "Countrie's Classics")
Mood.create(activity: "Acoustic Commute")
Mood.create(activity: "Partying Around The World")
Mood.create(activity: "Chilling")


# Users
5.times do
  User.create(full_name: Faker::Name.name, email: Faker::Internet.email, password: 'password', country: Country.all.sample.id, language: 'English' )
end
