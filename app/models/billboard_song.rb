class BillboardSong < ActiveRecord::Base
  include Factoid
  validates :track, :artist, presence: true
  validates :track, uniqueness: true
  before_save :format_strings

  def format_strings
    remove_cruff!(track)
    remove_cruff!(artist)
  end

  def remove_cruff!(string)
    string.gsub!(/^\s+/, "")
    string.gsub!(/\s+$/, "")
    string.gsub!(/\n/, "")
  end
end
