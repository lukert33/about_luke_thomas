class VisitorsController < ApplicationController
  def index
    @quote    = Quote.random_instance
    ratio_a   = Ratio.random_instance
    ratio_b   = other_rand_ratio(ratio_a)
    @ratios   = [ratio_a, ratio_b]
    @song     = BillboardSong.random_instance
    @flip     = rand(2)
  end
end