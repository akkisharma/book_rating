class Api::V1::SessionsController < ActionController::API

	def create

		if params[:email].present?
			user = User.where(email: params[:email]).first
			if user&.valid_password?(params[:password])
				render json: user, status: :created
			else
				head(:unauthorized)
			end
		else
			render json: {status: 'FAIL', message: 'please provide user details'}, status: :ok
		end
	end


	def destroy

	end
end