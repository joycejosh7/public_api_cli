class Cli
    def start
        puts "Welcome to the Public API database!"
        puts "loading..."
        Api.get_data
        main_menu_options
    end

    def main_menu_options
        puts "Type '1' to list APIs"
        puts "Type 'exit' to exit program"
        main_menu
    end

    def main_menu
        input = get_input

        if input == "1"
            list_apis
            puts "select API number for more information"
            main_menu_options
        elsif input == "exit"
            puts "Exiting Program"
            puts "Goodbye"
            exit
        else  
            invalid_choice
            main_menu_options
        end
    end

    def invalid_choice
        puts "Invalid Choice. Please Try Again!"
    end

    def get_input
        print "Enter Choice: "
        gets.chomp
    end

    def list_apis
        PublicApi.all.each.with_index(1) do |api, index|
            puts "#{index}. #{api.api}"
        end

        api_details_menu_options        
    end

    def api_details_menu_options
        puts "Select the number next to the API for more details."
        puts "Or type 'exit' to exit program"
        api_details_menu
    end 

    def api_details_menu
        input = get_input

        if input.to_i.between?(1, PublicApi.all.length)
            
        #    binding.pry 
           index = input.to_i - 1
           api = PublicApi.all[index]
           print_api_details(api)
           select_again_or_exit 
        elsif input == "exit"
            puts "Exiting Program"
            puts "Goodbye"
            exit
        else  
            invalid_choice
            api_details_menu_options
        end
    end

    def print_api_details(api)
        puts "------------------"
        puts "API Name: #{api.api}"
        puts "API Description: #{api.description}"
        puts "API Link: #{api.link}"
        puts "------------------"
    end

    def select_again_or_exit 
        puts "Would you like to go back to the main menu or exit?"
        puts "'1' for main menu"
        puts "'exit' to exit program"
        input = get_input

        if input == '1'
            main_menu_options
        elsif input == 'exit'
            puts "Goodbye!"
            exit
        else  
            invalid_choice
            select_again_or_exit
        end
    end
end