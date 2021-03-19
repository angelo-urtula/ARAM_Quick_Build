class Champ

    attr_accessor :name, :champ_url, :key_stone_rune, :first_rune, :second_rune, :third_rune, :fourth_rune, :fifth_rune, :first_shard, :second_shard, :third_shard, :first_sumspell, :second_sumspell, :first_priority_skill, :second_priority_skill, :last_priority_skill   
    @@all = []

    def initialize(champ_hash)
        @name = champ_hash[:name]
        @champ_url = champ_hash[:champ_url]
        @@all << self
    end

    def self.from_list_of_champs(champ_array)
        champ_array.each do |info|
            Champ.new(info)
        end
    end

    def give_the_build(build)
        @key_stone_rune= build[:key_stone_rune] 
        @first_rune = build[:first_rune]
        @second_rune = build[:second_rune]
        @third_rune = build[:third_rune]
        @fourth_rune = build[:fourth_rune]
        @fifth_rune = build[:fifth_rune]
        @first_shard = build[:first_shard]
        @second_shard = build[:second_shard]
        @third_shard = build[:third_shard]
        @first_sumspell = build[:first_sumspell]
        @second_sumspell = build[:second_sumspell]
        @first_priority_skill = build[:first_priority_skill]
        @second_priority_skill = build[:second_priority_skill]
        @last_priority_skill = build[:last_priority_skill]
    end

    def what_is_build?
        puts "Runes:"
        puts @key_stone_rune
        puts @first_rune 
        puts @second_rune 
        puts @third_rune 
        puts @fourth_rune 
        puts @fifth_rune 
        puts @first_shard 
        puts @second_shard 
        puts @third_shard
        puts
        puts "Summoner Spells:" 
        puts @first_sumspell 
        puts @second_sumspell
        puts
        puts "Skill Priority:" 
        puts "1st: #{@first_priority_skill}"
        puts "2nd: #{@second_priority_skill}"
        puts "Last: #{@last_priority_skill}"
    end

    def self.all
        @@all
    end
end