class MapsController < ApplicationController
  def index
    @user = current_user
    @books = @user.books
    @book = Book.new
  end
end
