class PostsController < ApplicationController
  before_action :authenticate_user,{only: [:new, :create, :edit, :update, :destroy]}
  
  def index
    @user = User.find_by(id: session[:user_id])
    @total_distance = Post.new
    @total_puts = Post.new
  end

  def new
    @user = User.find_by(id: session[:user_id])
    @post = Post.new
  end

  def create
    content_distance = Post.new

     @post = Post.new(
      content: params[:string],
      user_id: @current_user.id,
      content_distance: content_distance.sum_of_contentdistance(params[:string])
    )
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/users/#{@post.user_id}")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.content = params[:string]
    post.content_distance = post.sum_of_contentdistance(params[:string])
    post.save
    redirect_to("/users/#{post.user_id}")
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/users/#{post.user_id}")
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
