# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  @book = Book.create(:title => Faker::Book.title)
  @book.author = Author.create(:name => Faker::Book.author)
  @book.genre = Genre.create(:name => Faker::Book.genre)
  @book.price = Faker::Number.between(799, 1999)
  @book.inventory = Faker::Number.number(2)
  @book.save
end
