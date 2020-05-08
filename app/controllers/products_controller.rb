class ProductsController < ApplicationController

  def new
    @product = Product.new
    @product.images.build 
  end

  # 親カテゴリーが選択された後に動くアクション
  def category_children
    @category_children = Category.find("#{params[:parent_id]}").children
    #親カテゴリーに紐付く子カテゴリーを取得
  end

  # 子カテゴリーが選択された後に動くアクション
  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
    #子カテゴリーに紐付く孫カテゴリーの配列を取得
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :price,:category_id, :size, :status, :postage, :explanation, :transaction_status, :delivery_method, :delivery_origin, :arrival_date, :brand, images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
