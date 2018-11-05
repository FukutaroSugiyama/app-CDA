class UsersController < ApplicationController
  before_action :forbid_login_user,{only: [:login_form, :new, :create, :login]}
  before_action :authenticate_user,{only: [:show]}
  
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
    @total_distance = User.new
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
