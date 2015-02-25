module Factoid

  def self.included base
    base.extend ClassMethods
  end

  module ClassMethods
    def random_instance
      i = rand(1..self.count)
      self.find(i)
    end
  end

end