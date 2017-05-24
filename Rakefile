# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'rake'
require 'net/http'

Rails.application.load_tasks

namespace :generate do
  desc "Populates country and language table"
  task :populate_country_languages => :environment do # => enviroment so Rake task has access to models (scope issue)
      uri = URI.parse("https://raw.githubusercontent.com/mledoze/countries/master/countries.json")
      res = Net::HTTP.get_response(uri)
      result = res.body

      all_countries_hash = JSON.parse(result)

      all_countries_hash.each do |country|
        new_country = Country.create(name:country["name"]["common"] , spotify_iso_id: country["cca2"])

        country["languages"].each do |initials, language|
          language = Language.find_or_create_by(name: language)
          CountryLanguage.find_or_create_by(country_id: new_country.id, language_id: language.id)
        end

      end
  end
end
