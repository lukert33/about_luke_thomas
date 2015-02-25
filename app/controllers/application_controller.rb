class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

  def other_rand_ratio(ratio)
    other_ratio = Ratio.random_instance
    until other_ratio != ratio
      other_ratio = Ratio.random_instance
    end
    other_ratio
  end
end
