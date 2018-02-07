class Book
  include Mongoid::Document

  #fields
  field :name, type: String
  field :short_desc, type: String
  field :long_desc, type: String
  field :chapter_index, type: String
  field :publish_date, type: Date, default: (Date.today)
  field :genres, type: Array

  # assciations
  belongs_to :author
	has_many :reviews

  # validations
  validates_presence_of :name, :publish_date, :genres

end
