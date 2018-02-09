# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Ruby version: 2.4.1
Rails Version: 5.1.4


System dependencies
 - run bundle install


Database creation
 - run rake db:populate

Configuration
 - run rails console
 - create default user
 - User.create(email: "user@bookrating.com", password: 123456789, password_confirmation: 123456789)


Database initialization
 - run rake mongoid_search:index (for full text search functionality)


Services (job queues, cache servers, search engines, etc.)
 - create session by user details(email: user@bookrating.com, password: 123456789)
 - http://localhost:3000/api/v1/sessions
 - params: email: user@bookrating.com, password: 123456789

 - you will receive the token, use it in the book api requesting parameter
 - hit this web api end point using any REST api client
 	http://localhost:3000/api/v1/book_ratings/author_books?auth_token=MVh22vhpyVy9Pim7rGhH&search=<search text goes here from either book, author and review model>

 - eg. http://localhost:3000/api/v1/book_ratings/search_books?auth_token=MVh22vhpyVy9Pim7rGhH&search=The Wives of Bath (by book title)
 - eg. http://localhost:3000/api/v1/book_ratings/search_books?auth_token=MVh22vhpyVy9Pim7rGhH&search=Emmy Ondricka (by author)
 - eg. http://localhost:3000/api/v1/book_ratings/search_books?auth_token=MVh22vhpyVy9Pim7rGhH&search=​fantasy books (by genre)
 - eg. http://localhost:3000/api/v1/book_ratings/search_books?auth_token=MVh22vhpyVy9Pim7rGhH&search=Demario Mitchell (by reviewer name)



Deployment instructions
...


