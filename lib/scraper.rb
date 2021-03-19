require "open-uri"
require "nokogiri"

class Scraper
    def self.get_those_champs
        doc = Nokogiri::HTML(open("https://u.gg/lol/champions"))

        doc.css("a.champion-link").each do |champ|
            puts champ.css("div.champion-name").text
        end
    end
end

