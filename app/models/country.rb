class Country < ApplicationRecord
  has_many :countries_languages
  has_many :languages, through: :countries_languages
  has_many :users
end
