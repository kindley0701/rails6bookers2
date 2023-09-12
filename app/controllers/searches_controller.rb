class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]#検索範囲の取得
    if @range == "User"#検索範囲による分岐
      @users = User.looks(params[:search], params[:word])#検索結果の取得
    elsif @range == "Book"
      @books = Book.looks(params[:search], params[:word])#検索結果の取得
    else
      @books = Book.where(tag: params[:word])
    end
  end

  def index
    @book = Book.new
    # @range = params[:range]
    @word = params[:word]
    @page = params[:page] ||= 1

    if @word.nil?
      @books = []
    else
      @books = RakutenWebService::Books::Book.search(title: @word, page: @page)
      @total_pages = @books.response.page_count
      @count = @books.response.count
    end
  end
end
