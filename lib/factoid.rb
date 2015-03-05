module Factoid

  def self.included base
    base.extend ClassMethods
  end

  module ClassMethods
    def random_instance
      self.all.sample
    end
  end

end