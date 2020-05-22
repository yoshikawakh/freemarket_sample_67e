class ProductsController < ApplicationController
  before_action :set_product,           only: [:show, :edit, :update]
  before_action :set_user,              only: [:index,:show]

  def new
    @product = Product.new
    @product.images.build 
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, images: @product.images.build
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :price, :category_id, :size, :status, :postage, :explanation, :transaction_status, :delivery_method, :delivery_origin, :arrival_date, :brand, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
