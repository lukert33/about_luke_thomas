class Quote < ActiveRecord::Base
  include Factoid, Tokenized

  validates :excerpt, presence: true, uniqueness: true
  validates_length_of :excerpt, :maximum=>350
  validates_length_of :source, :author, :maximum=>110
  validate  :current_guest_token
  before_save :fill_author

  def fill_author
    author = author || "anonymous"
  end
end
