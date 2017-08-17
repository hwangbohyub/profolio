class CommentsController < ApplicationController
  def create
    if current_user.nil?
      redirect_to '/users/sign_in'
    elsif
      Comment.create(user_id: current_user.id, post_id: params[:post_id], comment: params[:comment])

      redirect_to "/posts/#{params[:post_id]}"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to "/posts/#{params[:post_id]}"
  end
end
