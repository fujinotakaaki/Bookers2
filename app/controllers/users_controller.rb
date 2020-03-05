class UsersController < ApplicationController
  def top
  end

  def about
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id then
      index
      redirect_to user_path(current_user)
    end
  end

  def index
    @book_new = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) then
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
