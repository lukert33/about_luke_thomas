class Quote < ActiveRecord::Base
  include Factoid, Tokenized

  validates :excerpt, presence: true, uniqueness: true
  validate  :current_guest_token
  before_save :fill_author

  def fill_author
    author = author || "anonymous"
  end

end
