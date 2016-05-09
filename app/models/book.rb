class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :genre

  validates :title, presence: true, uniqueness: true
  scope :available_books, -> { where('inventory > 0') }

  def author_attribute=(author_attribute)
    author = Author.find_or_create_by(author_attribute)
    self.author = author
  end

  def genre_attribute=(genre_attribute)
    genre = Genre.find_or_create_by(genre_attribute)
    self.genre = genre
  end

end
