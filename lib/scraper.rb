require "open-uri"
require "nokogiri"


class Scraper
    def self.get_those_champs
        doc = Nokogiri::HTML(open("https://u.gg/lol/champions"))

        doc.css("a.champion-link").collect do |champ|
            {
                :name => champ.css("div.champion-name").text,
                :champ_url => champ["href"]
        }
        end
    end
end




