class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @authors_list = Author.all.collect { |a| [a.fullname, a.id] }
  end

  def create
    @post = Post.new(post_params)
    @authors_list = Author.all.collect { |a| [a.fullname, a.id] }
    if @post.save
      redirect_to posts_path, notice: 'Post was created!'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @authors_list = Author.all.collect { |a| [a.fullname, a.id] }
  end

  def update
    @post = Post.find(params[:id])
    @authors_list = Author.all.collect { |a| [a.fullname, a.id] }
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post was updated!'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, notice: 'Post was deleted!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :author_id)
  end
end
