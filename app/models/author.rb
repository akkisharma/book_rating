class Author
  include Mongoid::Document
  include Mongoid::Paperclip

  #fields
  field :name, type: String
  field :bio, type: String
  field :academics, type: String
  field :awards, type: String
  has_mongoid_attached_file :avatar

  # assciations
  has_many :books

  # validations
  validates_presence_of :name, :bio
  validates_length_of :name, minimum: 3

  has_mongoid_attached_file :attachment,
    :styles => {
      :original => ['1920x1680>', :jpg],
      :medium   => ['250x250',    :jpg]
    }

end
