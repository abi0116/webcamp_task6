class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.favorites.new(book_id: book.id)
    comment.save
    redirect_back fallback_location: root_path
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = current_user.favorites.find_by(book_id: book.id)
    comment.destroy
    redirect_back fallback_location: root_path
  end

end
