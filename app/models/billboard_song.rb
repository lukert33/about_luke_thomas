class BillboardSong < ActiveRecord::Base
  validates :track, :artist, presence: true
end
