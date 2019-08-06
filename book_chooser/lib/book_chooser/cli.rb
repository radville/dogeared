class BookChooser::CLI

    def call
        scrape = BookChooser::Scraper.new.get_genres
        "Let's get started on choosing a book!"
        main_menu
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
                BookChooser::Genre.print_genre(input.to_i)
            else
                puts "Invalid command. Please type the number of a genre or 'exit.'"
            end
        end
    end

    def main_menu
        puts "Would you like help choosing a book? Y/n"
        input = nil
        until input == "n" || input == "y" || input == ""
            input = gets.strip.downcase
            if input == "y" || input == ""
                list_genres
            elsif input == "n" || input == "no"
                goodbye
            else
                puts "Invalid command. Please enter yes or no."
            end  
        end    
    end

    def goodbye
        puts "Happy reading!"
    end

end