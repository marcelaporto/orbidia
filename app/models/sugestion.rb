class Sugestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  belongs_to :mood
end
