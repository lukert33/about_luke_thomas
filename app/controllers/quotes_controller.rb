class QuotesController < ApplicationController

  def new
    @quote = @quote || Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def destroy
    #admin only
  end

  private

  def quote_params
    params.require(:quote).permit(:author, :source, :excerpt, :guest_token)
  end

end