class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def login_form
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password_digest: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user.id)
    
    
    @total_distance = 0
    
    for @var in @posts do
      @distance = @var.content_distance
      @total_distance += @distance
    end
    
  end

  def login
    @user = User.find_by(email: params[:email], password_digest: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end


end
