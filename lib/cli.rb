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
        puts "Please type in the number that corresponds to the champ you rolled for this ARAM match in order to view their build! Or type exit to close the app."
    end

    def options
        input = nil           #need this or else it will break
        while input != "exit"
            input = gets.chomp()
            if input.to_i > 0 && input.to_i <= Champ.all.size
                Champ.all[input.to_i-1].give_the_build(Scraper.champ_build("https://u.gg" + Champ.all[input.to_i-1].champ_url))
                puts "Looks like you rolled #{Champ.all[input.to_i-1].name}!"
                Champ.all[input.to_i-1].what_is_build?
                puts "If you would like to view a different champion, type their corresponding number. If you would like to view the list of champions again, type list. If you would like to close out, type exit."
            elsif input == "list"
                list_champs
            elsif input == "exit"
                break
            else
                puts "Please try a valid number! Or type list to review the valid inputs!"
            end
        end
    end

    def wish_you_luck
        puts "Good luck, and have fun out on the Murder Bridge, Summoner!"
    end
end