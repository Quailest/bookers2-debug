class BookCommentsController < ApplicationController
  def create
    @book=Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = @book.id
    @book_comment.save
    redirect_to book_path(@book), notice: "You have created comment successfully."
  end

  def destroy
   @book=Book.find(params[:book_id])
   @book_comment = BookComment.find(params[:id])
   @book_comment.destroy
   redirect_to book_path(@book), notice: "You have destroyed comment successfully."
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:book_comment)
  end
end
