Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, :defaults => {:format => :json} do
  	namespace :v1 do

  		resources :book_ratings do
  			collection do
  				post :author_books
  				get :genre_books
  			end
  		end

  	end
  end
end
