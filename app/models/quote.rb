class Quote < ActiveRecord::Base
  include Factoid
  validates :excerpt, presence: true
  before_save :fill_author

  def fill_author
    author = author || "anonymous"
  end

end
