class BooksController < ApplicationController
	before_action :ensure_user, :only=>[:edit, :update, :destroy]


	def ensure_user
		@book = Book.find(params[:id])
		if current_user.id != @book.user_id
			redirect_to books_path
			end
		end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:mess] = "edit successfully"
			redirect_to book_path(@book)
		else
			flash[:mess] = "edit error"
			redirect_to books_path
		end
	end

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def show
		@book_detail = Book.find(params[:id])
		@book = Book.new
		@user = @book_detail.user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:mess] = "edit successfully"
		else
			flash[:mess] = "edit error"
		end
		redirect_to book_path(@book)
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
