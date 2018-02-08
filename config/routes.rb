Rails.application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
  	namespace :v1 do

  		resources :book_ratings do
  			collection do
  				get :search_books
  			end
  		end

  	end
  end
end
