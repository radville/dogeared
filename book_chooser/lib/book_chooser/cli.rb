class BookChooser::CLI

    def call
        scrape = BookChooser::Scraper.new.get_genres
        main_menu
    end

    def main_menu
        puts "  //" + "   Dog-eared".bold
        puts " // " + ".✧･".colorize(:yellow) + "  UᵔﻌᵔU  ".colorize(:blue) + "･✧.  "  .colorize(:yellow)
        puts "// Get book suggestions from the New York Times Best Sellers list"
        input = nil
        until (1..2).include?(input)
            puts "Main menu".bold.colorize(:yellow)
            puts "1. Choose a book genre"
            puts "2. Exit"
            puts "\nType the menu number of your selection".colorize(:yellow)
            input = gets.strip.to_i
            case input 
            when 1
                genre_menu
            when 2
            else
                puts "Invalid command.".bold.colorize(:yellow)
            end
        end
        goodbye
    end

    def genre_menu
        input = nil
        until (1..11).include?(input)
            puts "Main menu".bold.colorize(:yellow)
            puts "-- Choose a book genre"
            BookChooser::Genre.print_all_genres
            puts "-- Exit"
            puts "\nType the number of the genre you would like to browse.".colorize(:yellow)
            input = gets.strip.to_i
            if (1..11).include?(input)
                genre = BookChooser::Genre.all[input.to_i - 1]
                list_books_menu(genre)
            else
                puts "Invalid command.".bold.colorize(:yellow)
            end
        end
    end

    def list_books_menu(genre)
        input = nil
        until input == 1 || input == 4
            puts "Main menu".bold.colorize(:yellow)
            puts "1. Choose a book genre"
            puts "   2. List books in #{genre.name}"
            puts "      3. Get details on a book in #{genre.name}"
            puts "4. Exit\n\n"
            puts "\nType the menu number of your selection".colorize(:yellow)
            input = gets.chomp.to_i
            case input
            when 1
                genre_menu
            when 2
                BookChooser::Genre.list_books(genre)
            when 3
                checkout_book(genre)
            when 4
                return input == 3
            else
                puts "Invalid command.".bold.colorize(:yellow)
            end
        end
    end

    def checkout_book(genre)
        input = nil
        until input == "back" || input.to_i > 0
            puts "Main menu".bold.colorize(:yellow)
            puts "-- Choose a book genre"
            puts "   -- List books in #{genre.name}"
            puts "      -- Get details on a book in #{genre.name}"
            puts "-- Exit\n\n"
            BookChooser::Genre.list_books_numbered(genre)
            puts "\nEnter book number for details, or type 'back'".bold.colorize(:yellow)
            input = gets.strip
            if input.to_i > 0
                BookChooser::Book.print_book_from_genre(genre, input.to_i)
            elsif "back"
            else
                puts "Invalid command.".bold.colorize(:yellow)
            end
        end
    end

    def goodbye
        puts "Happy reading!"
        puts "U•ﻌ•Uฅ".colorize(:blue)
    end

end