class Endorsement < ActiveRecord::Base
  belongs_to :users
  belongs_to :sugestion
end
