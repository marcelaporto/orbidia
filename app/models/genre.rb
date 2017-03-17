class Genre < ActiveRecord::Base
  has_many :songs
  belongs_to :preferable, polymorphic: true
end
