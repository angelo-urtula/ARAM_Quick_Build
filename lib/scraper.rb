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

    def self.champ_build(champ_url)
        doc = Nokogiri::HTML(open(champ_url))

        {
            :key_stone_rune => doc.css("div.perk.perk-active img").map{ |img| img['alt']}.uniq[0],
            :first_rune => doc.css("div.perk.perk-active img").map{ |img| img['alt']}.uniq[1],
            :second_rune => doc.css("div.perk.perk-active img").map{ |img| img['alt']}.uniq[2],
            :third_rune => doc.css("div.perk.perk-active img").map{ |img| img['alt']}.uniq[3],
            :fourth_rune => doc.css("div.perk.perk-active img").map{ |img| img['alt']}.uniq[4],
            :fifth_rune => doc.css("div.perk.perk-active img").map{ |img| img['alt']}.uniq[5],
            :first_shard => doc.css("div.shard.shard-active img").map{ |img| img['alt']}[0],
            :second_shard => doc.css("div.shard.shard-active img").map{ |img| img['alt']}[1],
            :third_shard => doc.css("div.shard.shard-active img").map{ |img| img['alt']}[2],
            :first_sumspell => doc.css("div.content-section_content.summoner-spells img").map{ |img| img['alt']}[0],
            :second_sumspell => doc.css("div.content-section_content.summoner-spells img").map{ |img| img['alt']}[1],
            :first_priority_skill => doc.css("div.skill-priority_content img").map{ |img| img['alt']}[0],
            :second_priority_skill => doc.css("div.skill-priority_content img").map{ |img| img['alt']}[1],
            :last_priority_skill => doc.css("div.skill-priority_content img").map{ |img| img['alt']}[2]
        }
    end
end




