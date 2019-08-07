class BookChooser::CLI

    def call
        # puts "light_black".light_black
        # puts "red".red
        # puts "light red".light_red
        # puts "green".green
        # puts "light green".light_green
        # puts "yellow".yellow
        # puts "light yellow".light_yellow
        # puts "blue".blue
        # puts "light blue".colorize(:light_blue)
        # puts "magenta".magenta
        # puts "light_magenta".light_magenta
        # puts "cyan".cyan
        # puts "light_cyan".light_cyan
        # puts "white".white
        # puts "light_white".light_white
        # puts "default".default
        scrape = BookChooser::Scraper.new.get_genres
        "Let's get started on choosing a book!"
        main_menu
    end

    def main_menu
        puts "Would you like help choosing a book? ".bold.colorize(:yellow) + "Y/n"
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
        puts "Book Genres:".bold.colorize(:yellow)
        BookChooser::Genre.all.each_with_index { |genre, index| puts "#{index+1}. #{genre.name}" }
        puts "\nChoose the number of the genre you would like to browse, or type 'exit'.".bold.colorize(:yellow)
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
        puts "Top books in #{genre.name}:".bold.colorize(:green)
        genre.books.each_with_index { |book, i| puts "#{i+1}. #{book.title} #{book.author}" }
        puts "\nType the number of the book you'd like more details on or type 'exit'".bold.colorize(:yellow)
        input = gets.strip.downcase
        if input.to_i > 0
            BookChooser::Book.print_book_from_genre(genre, input.to_i)
        elsif input == "exit"
            goodbye
        else
            "Invalid command. Please type the number of a book or 'exit.'"
        end
    end

    def goodbye
        puts "Happy reading!"
    end

end