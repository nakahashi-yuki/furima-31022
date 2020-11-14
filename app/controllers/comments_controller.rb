class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    item = Item.find(params[:item_id])

      if comment.save
        # content:、user: をチャネルjsのdataとして渡してる。
        ActionCable.server.broadcast 'comment_channel', content: comment, user: comment.user
        # redirect_to item_path(comment.item)→これ使うと非同期ではなくなる。
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
