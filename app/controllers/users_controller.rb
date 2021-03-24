class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.find_by(params[:id])
    @book = Book.new
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
