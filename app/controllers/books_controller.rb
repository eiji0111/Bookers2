class BooksController < ApplicationController
  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @users = User.all
    @user = User.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user)
  end
end
