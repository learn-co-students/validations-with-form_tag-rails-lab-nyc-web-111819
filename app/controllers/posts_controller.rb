class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.valid? == false
      render :new
    else
      redirect_to post_path(@post)
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.update(params['id'], post_params)
    if @post.valid? == false
      render :edit
    else
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
