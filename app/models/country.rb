class Country < ActiveRecord::Base
  has_many :languages
  has_many :users
  has_many :songs
  has_many :artists, through: :songs
  belongs_to :preferable, polymorphic: true

  before_save :add_iso

  def add_iso
    self.
  end


end
