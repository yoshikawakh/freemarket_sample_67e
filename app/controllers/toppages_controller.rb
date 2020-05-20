class ToppagesController < ApplicationController
  # def index_product_data
  #   @product_name = Product.all{:id[:product_name]}
  #   @price = Product.all{:id[:price]}
  #   @image = Image.all{:id[:product_id]}
  # end

  def index
    @product = Product.includes(:images).all.order(updated_at: :desc)
  end

  # def index_product_image_data
  #   if product_soldout
      
  #   else
      
  #   end
  # def
end
