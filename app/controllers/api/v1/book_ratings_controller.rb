class Api::V1::BookRatingsController < ActionController::API
	before_action :verify_auth_token

	def search_books

		begin
			search_params = params[:search].downcase

			if @user.present?
				if search_params.present?
					search_params = refactor_search_param
					books = Book.full_text_search(search_params, match: :all)
					render json: books, each_serializer: BookSerializer
				else
					render json: {status: "FAIL",
						data: "Please provide search keyword"}, status: :ok
				end
			else
				render json: {status: 'FAIL', message: 'You need to login for access books'}, status: :ok
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

	def verify_auth_token
		@user = User.find_by(authentication_token: params[:auth_token])
	end

end