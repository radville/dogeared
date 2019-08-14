class DogEared::CLI

    def call
        DogEared::Scraper.new.get_genres
        main_menu
    end

    def main_menu
        puts "      Dog-eared".bold
        puts "  .✧ ･".colorize(:yellow) + "  UᵔﻌᵔU  ".colorize(:green) + "･✧.".colorize(:yellow)
        puts "Get book suggestions from the New York Times Best Sellers list"
        input = nil
        until (1..2).include?(input)
            puts "--------------------------------------------------------"
            puts "Main menu".bold.colorize(:yellow)
            puts "1. Choose a book genre"
            puts "2. Exit"
            puts "--------------------------------------------------------\n\n"
            puts "Type the menu number of your selection".colorize(:color => :black, :background => :yellow)
            input = gets.strip.to_i
            system("clear") || system("cls")
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
            puts "--------------------------------------------------------"
            puts "Main menu".bold.colorize(:yellow)
            puts "-- Choose a book genre"
            puts "-- Exit\n\n"
            puts "--------------------------------------------------------"
            DogEared::Genre.print_all_genres
            puts "\n"
            puts "Type the number of the genre you would like to browse.".colorize(:color => :black, :background => :yellow)
            input = gets.strip.to_i
            system("clear") || system("cls")
            if (1..11).include?(input)
                genre = DogEared::Genre.all[input.to_i - 1]
                list_books_menu(genre)
            else
                puts "Invalid command.".bold.colorize(:yellow)
            end
        end
    end

    def list_books_menu(genre)
        DogEared::Scraper.make_books(genre)
        input = nil
        until input == 1 || input == 5
            puts "--------------------------------------------------------"
            puts "Main menu".bold.colorize(:yellow)
            puts "1. Choose a book genre"
            puts "   2. List all books in #{genre.name.bold}"
            puts "   3. List only new books in #{genre.name.bold}"
            puts "   4. Get details on a book in #{genre.name.bold}"
            puts "5. Exit"
            puts "--------------------------------------------------------\n\n"
            puts "Type the menu number of your selection".colorize(:color => :black, :background => :yellow)
            input = gets.chomp.to_i
            system("clear") || system("cls")
            case input
            when 1
                genre_menu
            when 2
                DogEared::Genre.list_books(genre)
            when 3
                DogEared::Genre.list_new_books(genre)
            when 4
                checkout_book(genre)
            when 5
                break
            else
                puts "Invalid command.".bold.colorize(:yellow)
            end
        end
    end

    def checkout_book(genre)
        input = nil
        until input == "back" || input.to_i.between?(1, genre.books.length)
            puts "--------------------------------------------------------"
            puts "Main menu".bold.colorize(:yellow)
            puts "-- Choose a book genre"
            puts "   -- List books in #{genre.name}"
            puts "      -- Get details on a book in #{genre.name}"
            puts "-- Exit"
            puts "--------------------------------------------------------\n\n"
            DogEared::Genre.list_books_numbered(genre)
            puts "\n" + "Enter book number for details, or type 'back'".colorize(:color => :black, :background => :yellow)
            input = gets.strip
            system("clear") || system("cls")
            if input.to_i >= 1 && input.to_i <= genre.books.length
                DogEared::Book.print_book_from_genre(genre, input.to_i)
            elsif input == "back"
            else
                puts "Invalid command.".bold.colorize(:yellow)
            end
        end
    end

    def goodbye
        puts "Happy reading!".bold
        puts "   U•ﻌ•Uฅ".colorize(:green)
    end

end