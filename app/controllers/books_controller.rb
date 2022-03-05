class BooksController < ApplicationController

  def show
    @book_comment = BookComment.new
    @book = Book.new
    @bookdetail = Book.find(params[:id])
    @books = Book.all
    @user =  @bookdetail.user
    @book_comments = @bookdetail.book_comments
  end

  def index
    @books = Book.all
    @book=Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id!=current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

  def book_comment_params
    params.require(:book_comment).permit(:book_comment)
  end

end
