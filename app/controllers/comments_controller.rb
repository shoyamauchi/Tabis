class CommentsController < ApplicationController
  before_action :authenticate_user! # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  def create
    @tabi = Tabi.find(params[:tabi_id])
    @comment = @tabi.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referer
    else
      redirect_to show_tabi_path
    end
  end

  def destroy
    @tabi = Tabi.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
