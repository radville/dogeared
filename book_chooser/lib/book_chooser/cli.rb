class BookChooser::CLI

    def call
        "Let's get started on choosing a book!"
        #BookChooser::Scraper.new.get_books - still need to make this
        main_menu
    end

    def list_genres
        puts "Great! Choose the number of the genre you would like to browse, or type 'exit'"
        puts "1. Non fiction"
        input = gets.strip
        if input == "exit"
            goodbye
        elsif input == "1"
            puts "list books from 1st genre"
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