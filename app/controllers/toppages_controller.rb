class ToppagesController < ApplicationController
  def index
    @product = Product.includes(:images).order(updated_at: :desc)
    @category_parent_array = ["---"]
    @category_parent_array = Category.limit(13).pluck(:name)
    respond_to do |format|
      format.html
      format.json
    end

  end
end
