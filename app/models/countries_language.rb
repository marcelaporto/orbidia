class CountriesLanguage < ActiveRecord::Base
  belongs_to :country
  belongs_to :language

  def self.get_countries(language, user_country)
    languageid = Language.find_by(name: language).id
    markets = CountriesLanguage.where(language_id: languageid)
    markets.map {|relation| Country.find(relation.country_id).spotify_iso_id if Country.find(relation.country_id).name != user_country }.compact
  end

end
