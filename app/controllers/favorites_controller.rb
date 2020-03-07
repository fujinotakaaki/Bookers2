class FavoritesController < ApplicationController

  def create
    logger.debug "createみろよみろよ"
    @favorite = current_user.favorites.new( book_id: params[:book_id] )
    @favorite.save!
    # redirect_back(fallback_location: root_path)
    # render json: @favorite
  end

  def destroy
    logger.debug "destroyみろよみろよ"
    @favorite = current_user.favorites.find_by( book_id: params[:book_id] )
    @favorite.destroy!
    # redirect_back(fallback_location: root_path)
    # render json: @favorite
  end

end
