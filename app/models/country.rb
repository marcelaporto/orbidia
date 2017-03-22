class Country < ActiveRecord::Base
  has_many :countries_languages
  has_many :languages, through: :countries_languages
  has_many :users
  has_many :songs
  belongs_to :preferable, polymorphic: true

end
