class BookChooser::CLI

    def call
        scrape = BookChooser::Scraper.new.get_genres
        main_menu
    end

    def main_menu
        puts "Would you like help choosing a book? ".bold.colorize(:yellow) + "Y/n"
        input = nil
        until input == "n" || input == "y" || input == "" || input == "no" || input == "yes"
            input = gets.strip.downcase
            if input == "y" || input == "" || input == "yes"
                puts "Great! Let's explore the New York Time Best Sellers list."
                genres_menu
            elsif input == "n" || input == "no"
                goodbye
            else
                puts "Invalid command. Please enter yes or no.".bold.colorize(:yellow)
            end  
        end    
    end

    def genres_menu
        input = nil
        until input == "exit" || input.to_i > 0
            puts "\nBook Genres:".bold.colorize(:yellow)
            BookChooser::Genre.all.each_with_index { |genre, index| puts "#{index+1}. #{genre.name}" }
            puts "\nType the number of the genre you would like to browse or 'exit'.".bold.colorize(:yellow)
            input = gets.strip
            if input.to_i > 0
                genre = BookChooser::Genre.all[input.to_i - 1]
                list_books_menu(genre)
            elsif input == "exit"
                goodbye
            else
                puts "Invalid command.".bold.colorize(:yellow)
            end
        end
    end

    def list_books_menu(genre)
        input = nil
        until input == "back" || input == "exit" || input == "list"
            puts "\nType 'list' to see #{genre.name} books, 'back' to choose another genre, or 'exit'".bold.colorize(:yellow)
            input = gets.chomp
            if input == "list"
                list_books(genre)
                checkout_book(genre)
            elsif input == "back"
                genres_menu
            elsif input == "exit"
                goodbye
            else
                puts "Invalid command.".bold.colorize(:yellow)
            end
        end
    end

    def list_books(genre)
        BookChooser::Scraper.make_books(genre.url) unless genre.books.length > 0
        puts "Top books in #{genre.name}:".bold.colorize(:green)
        genre.books.each_with_index { |book, i| puts "#{i+1}. #{book.title} #{book.author}" }
    end

    def checkout_book(genre)
        input = nil
        until input == "exit" || input == "back"
            puts "\nType the number of a book you'd like more details on, 'list' to see #{genre.name} books, 'back' to choose another genre, or 'exit'".bold.colorize(:yellow)
            input = gets.strip.downcase
            if input.to_i > 0
                BookChooser::Book.print_book_from_genre(genre, input.to_i)
            elsif input == "list"
                list_books(genre)
            elsif input == "back"
                genres_menu
            elsif input == "exit"
                goodbye
            else
                puts "Invalid command.".bold.colorize(:yellow)
            end
        end
    end

    def goodbye
        puts "Happy reading!"
    end

end