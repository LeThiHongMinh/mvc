class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :show, :destroy]
  before_action :set_discussion, only: [:create, :edit, :show, :update, :destroy]

  def create
    @comment = @discussion.comments.create(params[:comment].permit(:comment, :discussion_id))
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to discussion_path(@discussion), notice: 'Comment was successfully created.' }
        format.js
      else
        format.html { redirect_to discussion_path(@discussion), notice: 'Comment did not save. Please try again.' }
        format.js
      end
    end
  end

  def new
  end

  def destroy
    @comment = @discussion.comments.find(params[:id])
    @comment.destroy
    redirect_to discussion_path(@discussion), notice: 'Comment was successfully deleted.'
  end

  def edit
    # no need to find @discussion again since set_comment already finds it
    @comment = @discussion.comments.find(params[:id])
  end

  def update
    @comment = @discussion.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to discussion_path(@discussion), notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end
  
  private

  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end