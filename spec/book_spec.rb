require "book"
require "book_repository"


RSpec.describe Book do

    def reset_books_table
        seed_sql = File.read('spec/seeds_books.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
        connection.exec(seed_sql)
    end


    it "return the number of book in the DB" do
        repo = BookRepository.new

        books = repo.all

        expect(books.length).to eq(2) 

        expect(books[0].id).to eq('1')
        expect(books[0].title).to eq('divina commedia') 
        expect(books[0].author_name).to eq('Dante Alighieri') 

        expect(books[1].id).to eq('2')
        expect(books[1].title).to eq('1984') 
        expect(books[1].author_name).to eq('George Orwel') 

    end
end