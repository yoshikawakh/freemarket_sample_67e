class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @product = Product.find(params[:product_id])
    @comment.save
    redirect_to product_path(@product)
  end
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
