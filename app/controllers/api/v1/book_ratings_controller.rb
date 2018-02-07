class Api::V1::BookRatingsController < ActionController::API

	def author_books

		begin
			# binding.pry
			if params[:search].present?
				books = Book.full_text_search(params[:search])
				render json: {status: "SUCCESS",
					data: books}, status: :ok
			else
				render json: {status: "FAIL",
					data: "Please provide author name"}, status: :ok
			end
		rescue
			render json: {
				error: "Please contact Service at sharma.akash1892@gmail.com for the selected destinations."
			}
		end
	end

	def books_by_genre
		begin
			genre_name = Array(params[:genre_name])
			if genre_name
				books = Book.where(genre: genre_name)
				render json: {status: "SUCCESS",
					data: books}, status: :ok
			else
				render json: {status: "FAIL",
					data: "Please provide genre name"}, status: :ok
			end
		rescue
			render json: {
				error: "Please contact Service at sharma.akash1892@gmail.com for the selected destinations."
			}
		end
	end

end