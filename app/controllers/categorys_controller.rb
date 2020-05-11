class CategorysController < ApplicationController
  def index
    @parents = Category.all.limit(13)
  end
end
