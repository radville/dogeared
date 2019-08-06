class BookChooser::CLI

    def call
        "Let's get started on choosing a book!"
        #BookChooser::Scraper.new.get_books - still need to make this
        main_menu
    end

    def list_books
        puts "list some books"
    end

    def main_menu
        puts "Would you like help choosing a book? Y/n"
        input = gets.strip.downcase
        if input == "y" || input == "yes" || input == ""
            list_books
        elsif input == "n" || input == "no"
            puts "No problem!" + goodbye
        else
            puts "Invalid command. Please enter yes or no."
        end   
    end

    def goodbye
        "Happy reading!"
    end

end