class BooksController < ApplicationController
	def index
		@user = current_user
		@book=Book.new
		@books=Book.all
	end
	def edit
	end
	def show
		@book=Book.find(params[:id])
		@user = User.find(@book.user_id)
	end
	def update
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
	def create
		@book = Book.new(book_params)
		@book.user_id=current_user.id
		if @book.save
		   redirect_to book_path(@book.id)
		else
		   redirect_to books_path
		end
	end
	private
	def book_params
		params.require(:book).permit(:title,:body,:user_id)
	end
end
