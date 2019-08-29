class UsersController < ApplicationController
  before_action :ensure_user, :only=>[:edit, :update]

  def ensure_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user)
    end
  end


  def index
	@users = User.all
  @user = current_user
  @book = Book.new
  end

  def top
  end

  def about
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:mess] = "edit successfully"
    else
      flash[:mess] = "edit error"
    end
    redirect_to user_path(@user)
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
