class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.build(book_comment_params)
    @book_comment.user_id = current_user.id
    if @book_comment.save
      redirect_to @book
    else
      @new_book = Book.new
      @book_comments = @book.book_comments.reload
      @user = @book.user
      render "books/show"
    end
  end

  def destroy
    book_comment = BookComment.find(params[:id])
    book_comment.destroy!
    redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
