Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, :defaults => {:format => :json} do
  	namespace :v1 do

  		resources :book_ratings do
  			get :book_by_author
  			get :book_by_genre
  		end

  	end
  end
end
