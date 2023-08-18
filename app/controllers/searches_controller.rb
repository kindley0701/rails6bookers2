class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]#検索範囲の取得
    if @range == "User"#検索範囲による分岐
      @users = User.looks(params[:search], params[:word])#検索結果の取得
    elsif @range == "Book"
      @books = Book.looks(params[:search], params[:word])#検索結果の取得
    elsif @range == "TagList"
      @books = Book.tagged_with(params[:word])
    end
  end
end
