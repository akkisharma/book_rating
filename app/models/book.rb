class Book
  include Mongoid::Document

  #fields
  field :name, type: String
  field :short_desc, type: String
  field :long_desc, type: String
  field :chapter_index, type: String
  field :publish_date, type: String
  field :genres, type: Array

  # assciations
  belongs_to :author
	has_many :reviews

  # validations
  validates_presence_of :name, :short_desc, :publish_date, :genres
  validates_length_of :name, minimum: 3

end
