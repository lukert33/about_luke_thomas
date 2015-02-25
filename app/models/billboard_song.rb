class BillboardSong < ActiveRecord::Base
  include Factoid
  validates :track, :artist, presence: true
  validates :track, uniqueness: true
end
