class Ratio < ActiveRecord::Base
  validates :number, :description, presence: true
  validates :description, uniqueness: true
  before_save :build_floats

  include Factoid

  def build_floats
    num = number.gsub(/,/, "")
    self.numfloat = num.to_f if numfloat == nil
  end

end
