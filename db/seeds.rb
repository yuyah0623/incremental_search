require "csv"

CSV.foreach('db/books.csv') do |row|
  Book.create(title: row[1], image: row[2])
end