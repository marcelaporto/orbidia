class Preference < ActiveRecord::Base
  belongs_to :user
  has_many :countries, as: :preferable
  has_many :languages, as: :preferable
  has_many :genres, as: :preferable
  has_many :mood, as: :preferable
end
