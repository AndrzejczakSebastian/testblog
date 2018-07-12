class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    @authors_list = Author.all.collect { |a| [a.fullname, a.id] }
    @posts_list = Post.all.collect { |p| [p.title, p.id] }
  end

  def create
    @comment = Comment.new(comment_params)
    @authors_list = Author.all.collect { |a| [a.fullname, a.id] }
    @posts_list = Post.all.collect { |p| [p.title, p.id] }
    if @comment.save
      redirect_to comments_path, notice: 'Comment was created!'
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @authors_list = Author.all.collect { |a| [a.fullname, a.id] }
    @posts_list = Post.all.collect { |p| [p.title, p.id] }
  end

  def update
    @comment = Comment.find(params[:id])
    @authors_list = Author.all.collect { |a| [a.fullname, a.id] }
    @posts_list = Post.all.collect { |p| [p.title, p.id] }
    if @comment.update(comment_params)
      redirect_to comments_path, notice: 'Comment was updated!'
    else
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comments_path, notice: 'Comment was deleted!'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id)
  end
end
