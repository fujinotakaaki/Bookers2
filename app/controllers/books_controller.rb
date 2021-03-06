class BooksController < ApplicationController
  # before_action :set_book, only: [:show, :edit, :update, :destroy]
  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save then
      redirect_to book_path(@book_new), notice: 'You have created book successfully.'
    else
      @books = Book.all
      @favorites = current_user.favorites
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id then
      redirect_to books_path
    end
  end

  def index
    @book_new = Book.new
    @books = Book.all
    @favorites = current_user.favorites
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @favorites = current_user.favorites
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params) then
      redirect_to book_path(@book), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
