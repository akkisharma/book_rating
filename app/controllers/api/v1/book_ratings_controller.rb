class Api::V1::BookRatingsController < ActionController::API

	def search_books

		begin
			search_params = params[:search].downcase

			if search_params.present?
				search_params = refactor_search_param
				books = Book.full_text_search(search_params, match: :all)
				render json: {status: "SUCCESS",
					data: books}, status: :ok
			else
				render json: {status: "FAIL",
					data: "Please provide search keyword"}, status: :ok
			end
		rescue
			render json: {
				error: "Please contact service at sharma.akash1892@gmail.com for the selected destinations."
			}
		end
	end

	private
	def refactor_search_param
		search_params = params[:search].downcase
		search_params.slice! 'books'
		search_params.slice! 'book'
		search_params.slice! 'author'
		search_params.slice! 'genres'
		search_params.slice! 'genre'
		search_params.strip!
		search_params
	end

end