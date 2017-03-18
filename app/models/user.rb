class User < ActiveRecord::Base
  belongs_to :country
  has_many :sugestions
  has_many :endorsements
  has_many :preferences
end
