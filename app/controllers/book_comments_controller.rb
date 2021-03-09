class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new
    book_comment = current_user.book_comments.new(book_comment_params)#フォームに渡した@book_comment = BookComment.new に@book_commentを合わせてる
    book_comment.book_id = @book.id
    if book_comment.save
      #redirect_to book_path(@book.id)
    else
      @booknew = Book.new
      @user = User.find(@book.user_id)
      render "books/show"
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new
    BookComment.find_by(id: params[:id],book_id: params[:book_id]).destroy
    #redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
