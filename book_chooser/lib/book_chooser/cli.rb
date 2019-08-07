class BookChooser::CLI

    def call
        scrape = BookChooser::Scraper.new.get_genres
        "Let's get started on choosing a book!"
        main_menu
    end

    def main_menu
        puts "Would you like help choosing a book? Y/n"
        input = nil
        until input == "n" || input == "y" || input == "" || input == "no" || input == "yes"
            input = gets.strip.downcase
            if input == "y" || input == "" || input == "yes"
                list_genres
            elsif input == "n" || input == "no"
                goodbye
            else
                puts "Invalid command. Please enter yes or no."
            end  
        end    
    end

    def list_genres
        puts "Great! Book Genres:"
        BookChooser::Genre.all.each_with_index { |genre, index| puts "#{index+1}. #{genre.name}" }
        puts "\nChoose the number of the genre you would like to browse, or type 'exit'."
        input = nil
        until input == "exit" || input.to_i > 0
            input = gets.strip
            if input == "exit"
                goodbye
            elsif input.to_i > 0
                list_books(input.to_i - 1)
            else
                puts "Invalid command. Please type the number of a genre or 'exit.'"
            end
        end
    end

    def list_books(index)
        genre = BookChooser::Genre.all[index]
        BookChooser::Scraper.make_books(genre.url) unless genre.books.length > 0
        puts genre.name
        genre.books.each_with_index { |book, i| puts "#{i+1}. #{book.title}" }
    end

    def goodbye
        puts "Happy reading!"
    end

end