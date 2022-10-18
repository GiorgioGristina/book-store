# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/book_repository'


# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

repo = BookRepository.new()


# Print out each record from the result set .
repo.all.each_with_index do |record, i|
    puts "#{i + 1} - #{record.title} - #{record.author_name}"
end