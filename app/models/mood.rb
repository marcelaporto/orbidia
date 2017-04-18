class Mood < ActiveRecord::Base
  has_many :sugestions
  has_many :songs, through: :sugestions
  has_many :genres, through: :songs
  belongs_to :preferable, polymorphic: true
end
