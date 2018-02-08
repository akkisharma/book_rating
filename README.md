# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Ruby version: 2.4.1
Rails Version: 5.1.4


System dependencies
 - run bundle install


Configuration
 -

Database creation
 - run rake db:populate


Database initialization
 - run rake mongoid_search:index(for full text search functionality)


Services (job queues, cache servers, search engines, etc.)
 - hit this web api end point using any REST api client
 	http://localhost:3000/api/v1/book_ratings/author_books?search=<search text goes here from either book, author and review model>

 - eg. http://localhost:3000/api/v1/book_ratings/search_books?search=Emmy Ondricka (by author)
 - eg. http://localhost:3000/api/v1/book_ratings/search_books?search=​fantasy books (by genre)
 - eg. http://localhost:3000/api/v1/book_ratings/search_books?search=The Wives of Bath (by book title)

Deployment instructions
	-
...


