class Country < ActiveRecord::Base
  has_many :languages
  has_many :users
  has_many :songs
  has_many :artists, trough: :songs
  belongs_to :preferable, polymorphic: true
end
