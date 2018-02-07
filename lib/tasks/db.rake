require "open-uri"

namespace :db do

	desc "populate the database with faker"

	task populate: :environment do

		begin
			# clear database
			Author.destroy_all
			Book.destroy_all
			Review.destroy_all

			avatar_url = Faker::Avatar.image("my_profile_image", "250x250", "jpg")
			genre_names = ['Science fiction','Satire','Drama','Action and Adventure','Romance','Mystery','Horror','Self help','Fantasy']

			1000.times do

				author = Author.new(
					name:         Faker::Name.name,
					bio:          Faker::Lorem.paragraph(50),
					academics:    Faker::Educator.course,
					awards:       Faker::Educator.university,
					avatar:       open(avatar_url)
					)
				# ensure the unique name validation
				# if author.invalid?
				# 		author_name = generate_unique_name(author) #replace new author name
				# 		if author_name
				# 			author.name = author_name
				# 		else
				# 			puts "----------------------------------------------------"
				# 			puts "Faker tried fetching unique name more than 5 time..."
				# 			puts "But didn't any new unique name"
				# 		end
				# 	end
					author.save!

				# 1000(author) * 5(books) = 5000(total books)
				5.times do
					random_genres = genre_names.shuffle.sample(rand(1..9))
					book = author.books.new(
						name:           Faker::Book.title,
						short_desc:     Faker::Lorem.sentence(10),
						long_desc:      Faker::Lorem.sentence(40),
						chapter_index:  Faker::Lorem.sentence(60),
						publish_date:   Faker::Date.backward(14),
						genres:         random_genres
						)
					# ensure the unique name validation
					# if book.invalid?
					# 	book_name = generate_unique_name(book) #replace new book name
					# 	if book_name
					# 		book.name = book_name
					# 	else
					# 		puts "----------------------------------------------------"
					# 		puts "Faker tried fetching unique name more than 5 time..."
					# 		puts "But didn't any new unique name"
					# 	end
					# end
					book.save!

					# 5000(books) * 25(reviews) = 25000(total reviews)
					5.times do
						review = book.reviews.new(
							reviewer:   Faker::Name.name,
							rating:     rand(0..5),
							title:      Faker::Lorem.sentence(3),
							desc:       Faker::Lorem.sentence(10)
							)
						review.save!
					end
				end
			end
		rescue Exception => e
			handle_unique_record_exception(e)
		end
	end

	# def generate_unique_name(object)
	# 	author_name_count_recursion_count = 0
	# 	book_name_count_recursion_count = 0
	# 	begin
	# 		case object.class.to_s
	# 		when 'Author'
	# 			object.name = Faker::Name.name
	# 			if object.invalid?
	# 				author_name_count_recursion_count += 1
	# 				if author_name_count_recursion_count < 5
	# 					generate_unique_name(object)
	# 				else
	# 					return nil
	# 				end
	# 			end

	# 		when 'Book'
	# 			object.name = Faker::Book.title
	# 			if object.invalid?
	# 				book_name_count_recursion_count
	# 				if book_name_count_recursion_count < 5
	# 					generate_unique_name(object)
	# 				else
	# 					return nil
	# 				end
	# 			end
	# 		end
	# 		object.name
	# 	rescue Exception => e
	# 		handle_unique_record_exception(e)
	# 	end
	# end

	def handle_unique_record_exception(error)
		puts "Exception handled: #{error}"
		puts "------------------------------------------------------------------"
		puts "There no more unique records available for Author or Book in Faker"
		puts "Retrived:"
		puts "Author count: #{Author.count}"
		puts "Book count: #{Book.count}"
		puts "Review count: #{Review.count}"
	end

end
