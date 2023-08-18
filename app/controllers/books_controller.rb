class BooksController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @comments = @book.book_comments
    @comment = BookComment.new
    view_count = ViewCount.find_by(book_id: @book.id, user_id: current_user.id)
    unless view_count
      ViewCount.create(book_id: @book.id, user_id: current_user.id)
    end
  end

  def index
    to  = Time.current.at_end_of_day #今日の終わりの時間
    from  = (to - 6.day).at_beginning_of_day #今日を基準に6日前の始まりの時間
    @books = Book.includes(:favorites). #includesメソッドって何の役割？
      sort {|a,b| #これもよくわからん
        b.favorites.where(created_at: from...to).size <=>
        a.favorites.where(created_at: from...to).size
      }
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
    if params[:book][:new_tag]
      @book.tag_list.push(params[:book][:new_tag])
    end
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
    params.require(:book).permit(:title, :body, :rate, :tag, :tag_list) #tagはタグ１つのみの場合のみ，tag_listはタグ追加機能用の配列．
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    unless @user == current_user
      redirect_to books_path
    end
  end
end
