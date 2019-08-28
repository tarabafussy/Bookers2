class UsersController < ApplicationController
  def index
	@users = User.all
  @book = Book.new
  end

  def top
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
    @user.update(user_params)
    redirect_to user_path
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
