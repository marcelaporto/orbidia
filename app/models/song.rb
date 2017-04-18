class Song < ActiveRecord::Base
  belongs_to :country, class_name: "Country"
  belongs_to :genre
  has_many :sugestions
end
