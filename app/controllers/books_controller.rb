class BooksController < ApplicationController

  before_action :require_user, only: [:index, :show, :new, :search]
  before_action :require_admin, only: [:destroy]

  def index
    @books = Book.order('created_at')
  end

  def show
    @book = Book.find(params[:id])
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
      flash[:error] = "Error Uploading"
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
      flash[:error] = "Error Edit"
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:success] = "Book Deleted!"
    redirect_to "/books"
  end

  def search
    @books = Book.search(params[:query])
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :classname, :edition, :document)
  end

end
