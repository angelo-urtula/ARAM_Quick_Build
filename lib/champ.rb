class Champ

    attr_accessor :name, :runes, :summoner_spells, :skill_priority
    @@all = []

    def initialize(champ_hash)
        @name = champ_hash[:name]
        @@all << self
    end

    def self.from_list_of_champs(champ_array)
        champ_array.each do |info|
            Champ.new(info)
        end
    end


    def self.all
        @@all
    end
end