class UsersController < ApplicationController
  def index
	@users = User.all
  end

  def top
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  end
end
