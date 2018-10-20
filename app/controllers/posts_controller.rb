class PostsController < ApplicationController
  def total
    @user = User.find_by(id: session[:user_id])
    @posts = Post.all
    
    @total_distance =0
    
    for @var in @posts do
      @c_distance = @var.content_distance
      @total_distance += @c_distance
    end
    
    case @total_distance
      when 0..100
        @total_puts = "CDAの誕生"
      when 100..200
        @total_puts = "100m到達！！ウサイン・ボルトと走ろう"
      else
        @total_puts = "我々は未開の地に足を踏み入れたようだ..."
    end
    
  end
  
  def new
    @user = User.find_by(id: session[:user_id])
    @post = Post.new
  end
  
  def create

    @string = params[:string]
    @characters = @string.chars #1文字1文字に分解（データは配列）
    #データベースから文字距離を引っ張ってくる。なおかつ変数距離に代入してく
    @content_distance = 0
    for @var in @characters do
      @c_distance = Character.find_by(character: @var)
      @content_distance += @c_distance.character_distance
    end

     @post = Post.new(
      content: params[:string],
      user_id: @current_user.id,
      content_distance: @content_distance
    )
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/users/#{@post.user_id}")
    else
      render("posts/new")
    end
  end
end
