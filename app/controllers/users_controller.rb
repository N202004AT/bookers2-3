class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		@book = Book.new
		@users = User.all
		@user = current_user
	end
	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		user = User.find(params[:id])
		user.update(user_params)
		flash[:success]='You have updated user successfully.'
		redirect_to user_path(user.id)
	end

    private
	def user_params
		params.require(:user).permit(:name,:image,:introduction)
	end


end
