class CommentsController < ApplicationController
  def new
    @comment = Comment.new

  end

  def index
    @comment = Comment.all.includes(:topics, :comments,)
  end

  def create
    @comment = current_user.comments.new(description: params[:comment][:description])
    @comment.topic_id = params[:comment][:topic_id]
    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      redirect_to new_comment_path(topic_id: params[:comment][:topic_id]), danger: 'コメントに失敗しました'
  end


 end
end
