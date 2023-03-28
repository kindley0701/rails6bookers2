class BooksController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @comments = @book.book_comments
    @comment = BookComment.new
  end

  def index
    @book = Book.new
    if params[:sort] == 'newer'
      @books = Book.order(created_at: 'DESC')
    elsif params[:sort] == 'higher'
      @books = Book.order(rate: 'DESC')
    else
      @books = Book.all
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    @page = 'edit'
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
    params.require(:book).permit(:title, :body, :rate)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    unless @user == current_user
      redirect_to books_path
    end
  end
end
