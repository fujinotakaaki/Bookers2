class BookCommentsController < ApplicationController
  before_action :baria_user, only: [:destroy]

  def create
    @book_comment = current_user.book_comments.new( book_comment_params )
    @book_comment.book_id = params[:book_id]
    if @book_comment.save then
      @book_comment = BookComment.new( book_id: params[:book_id] )
    end
  end

  def destroy
    book_comment = BookComment.find(params[:book_id])
    book_comment.destroy
    @book_comment = BookComment.new( book_id: book_comment.book_id )
  end

  private
  def book_comment_params
    params.require( :book_comment ).permit( :comment )
  end

  def baria_user
    unless BookComment.find(params[:book_id]).user_id == current_user.id
      redirect_to book_path( params[:book_id] )
    end
  end
end
