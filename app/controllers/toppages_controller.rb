class ToppagesController < ApplicationController
  def index
    @product = Product.includes(:images).order(updated_at: :desc)
  end
end
