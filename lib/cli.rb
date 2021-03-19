class CommandLineInterface

    def run
        puts "Welcome, Summoner! Here is a list of every available champion:"
        make_list
        list_champs
        options
        wish_you_luck
    end

    def make_list
        Champ.from_list_of_champs(Scraper.get_those_champs)
    end


    def list_champs
        Champ.all.each_with_index do |champ, i|
            puts "#{i+1}. #{champ.name}"
        end


    end

    def options
        input = nil
        puts "Please type in the number that corresponds to the champ you rolled for this ARAM match!"
        while input != "exit"
            input = gets.chomp()
            if input.to_i > 0 && input.to_i <= Champ.all.size
                puts Champ.all[input.to_i-1].name
                puts "If you would like to view a different champion, type their corresponding number. If you would like to view the list of champions again, type list. If you would like to close out, type exit."
            elsif input == "list"
                list_champs
            elsif input == "exit"
                break
            else
                puts "Please try a valid number!"
            end
        end
    end

    def wish_you_luck
        puts "Good luck, and have fun out on the Murder Bridge, Summoner!"
    end
end