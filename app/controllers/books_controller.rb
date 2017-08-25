class BooksController < ApplicationController

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def download_image
    @book = Book.find(params[:id])
    send_data @book.image, filename: "#{@book.title}.jpg", type: "image/jpg"
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:id)
  end

end
