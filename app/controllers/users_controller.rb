class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @products = @user.products
    @favorite_products = @user.favorite_products
  end
end
