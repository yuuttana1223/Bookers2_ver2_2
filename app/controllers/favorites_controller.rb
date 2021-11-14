class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(book_id: params[:book_id])
    favorite.save!
    redirect_back fallback_location: root_path
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    favorite.destroy!
    redirect_back fallback_location: root_path
  end
end
