class BooksController < ApplicationController
  
  def create
      userId = current_user.id
      @user = User.find_by(id: userId)
      @book = Book.new(book_params)
      @books = Book.all
      @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else 
      render :index
    end
  end
  
  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    userId = @book.user_id
    @user = User.find_by(id: userId)
    @book_comment = BookComment.new
  end
  
  def index
    @book = Book.new
    @books = Book.all
    userId = current_user.id
    @user = User.find_by(id: userId)
    @users = User.all
  end
  
  def edit
    userId = current_user.id
    @user = User.find_by(id: userId)
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
    else
      redirect_to books_path
    end
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
