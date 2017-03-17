class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :country, through: :artists
  belongs_to :genre
  has_many :sugestions
end
