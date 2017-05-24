class Country < ActiveRecord::Base
  has_many :countries_languages
  has_many :languages, through: :countries_languages
  has_many :users


end
