class CommentsController < ApplicationController

  def create
    @card=Card.find(params[:card_id])
    @comment=@card.comments.new(comment_params)
    # @comment=Comment.new(comments_params)
    # @Comment.card=@card

    if @comment.save
      redirect_to @card ,notice: '留言成功'
    else
      render 'cards/show'
    end

  end

  def destroy
    comment=Comment.find(params[:id])
    #comment.update(deleted_at: Time.now)    
    comment.destroy
    redirect_to comment.card
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
