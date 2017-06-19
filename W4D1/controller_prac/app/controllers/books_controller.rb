class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    render :new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to books_url
    else
      # flash.now[:errors] = book.errors.full_messages
      render json: book.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to books_url
    else
      render json: "Can't destroy this book."
    end
  end

  protected

  def book_params
    params.require(:book).permit(:title, :author)
  end

end
