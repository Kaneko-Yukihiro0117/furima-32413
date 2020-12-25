class CommentsController < ApplicationController

  def create 
    @comment = Comment.new(comment_params)
    @comment.product_id = params[:product_id]
    if @comment.save
      flash[:success] = 'コメントしました'
      redirect_to @comment.product
    else
      @product = @comment.product
      @comment = @pproduct.comment
      render template: 'products/show'
    end
  end

    def destroy
      @product = product.find(params[:product_id])
        product_comment = @product.product_comments.find(params[:id])
        if product_comment.user != current_user
            redirect_to request.referer
        end
        product_comment.destroy
        redirect_to request.referer
    end
  
 private

  def  comment_params
    params[:comment].permit(:text, :prototype_id, :user_id).merge(
    user_id: current_user.id, product_id: params[:product_id])
  end
end 
