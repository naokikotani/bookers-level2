class BooksController < ApplicationController
  
  def create
      userId = current_user.id
      @user = User.find_by(id: userId)
      @book = Book.new(book_params)
      @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else 
      render template: "users/show"
    end
  end
  
  def show
    @book = Book.find(params[:id])
    userId = @book.user_id
    @user = User.find_by(id: userId)
  end
  
  def index
    @book = Book.new
    @books = Book.all
    userId = current_user.id
    @user = User.find_by(id: userId)
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book= Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
