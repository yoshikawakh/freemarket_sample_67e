class ToppagesController < ApplicationController

  def index
    @product = Product.includes(:images).all.order(updated_at: :desc)
  end

end
