class Language < ApplicationRecord
  has_many :countries_languages
  has_many :countries, through: :countries_languages
end
