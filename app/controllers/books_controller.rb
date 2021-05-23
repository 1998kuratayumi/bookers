class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end


  def create
    @book = Book.new(books_params)
    if @book.save
      flash[:notice] = "book was successfully created"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice2] = "book was successfully updated"
      redirect_to book_path(@book.id)
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    if book.destroy
      flash[:notice3] = "book was successfully destroyed"
      redirect_to books_path
    else
      redirect_to books_path
    end
  end

  private
  def books_params
    params.require(:book).permit(:title, :body)
  end
end
