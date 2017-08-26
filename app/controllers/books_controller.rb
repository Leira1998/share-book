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
      flash[:success] = "Book Created!"
      redirect_to @book
    else
      render "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "Book Updated!"
      redirect_to(:action => 'show', :id => @book.id)
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:success] = "Book Deleted!"
    redirect_to root_path
  end

  private
  def book_params
    params.require(:book).permit(:id, :title, :body, :image)
  end

end
