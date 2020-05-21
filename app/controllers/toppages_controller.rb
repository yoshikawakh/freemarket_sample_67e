class ToppagesController < ApplicationController
  # def index_product_data
  #   @product_name = Product.all{:id[:product_name]}
  #   @price = Product.all{:id[:price]}
  #   @image = Image.all{:id[:product_id]}
  # end
  def index
    @products = Product.includes(:images).all.order(updated_at: :desc)
  end
end
