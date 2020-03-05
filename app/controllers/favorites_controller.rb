class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.new( book_id: params[:book_id] )
    favorite.save
    # logger.debug 'ここみて'
    # logger.debug favorite
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = Favorite.where( "user_id = ?", current_user.id ).find_by( book_id: params[:book_id] )
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private
end
