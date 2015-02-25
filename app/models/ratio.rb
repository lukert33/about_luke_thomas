class Ratio < ActiveRecord::Base
  validates :number, :description, presence: true
  before_save :build_floats

  include Factoid

  def build_floats
    num = number.gsub(/,/, "")
    self.numfloat = num.to_f if numfloat == nil
  end

end
