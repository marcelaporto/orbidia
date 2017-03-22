class Language < ActiveRecord::Base
  has_many :countries_languages
  has_many :countries, through: :countries_languages
  
  belongs_to :preferable, polymorphic: true
end
