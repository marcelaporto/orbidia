class Language < ActiveRecord::Base
  has_many :countries
  belongs_to :preferable, polymorphic: true
end
