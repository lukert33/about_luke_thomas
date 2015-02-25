class FactoidsController < ApplicationController

  def index
    @quote    = Quote.random_instance
    ratio_a   = Ratio.random_instance
    ratio_b   = other_rand_ratio(ratio_a)
    @ratios   = [ratio_a, ratio_b]
    @song     = BillboardSong.random_instance
    @flip     = rand(2)

    render "index"
  end

  def new
    #admin only
  end

  def create
    #admin only
  end

  def destroy
    #admin only
  end

  private

  def other_rand_ratio(ratio)
    other_ratio = Ratio.random_instance
    until other_ratio != ratio
      other_ratio = Ratio.random_instance
    end
    other_ratio
  end

end