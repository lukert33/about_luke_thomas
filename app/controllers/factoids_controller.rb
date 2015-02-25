class FactoidsController < ApplicationController

  def index
    quote = Quote.random_instance
    ratio = Ratio.random_instance
    song  = BillboardSong.random_instance
    render text: [quote.excerpt, ratio.description, song.track]
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

end