class DndApi
    BASE_URL = "http://dnd5eapi.co/api/"

    def self.classes
        result = []
        classes = HTTParty.get("#{BASE_URL}classes")
        classes['results'].each do |class_index|
            result.append(class_by_name = HTTParty.get("#{BASE_URL}classes/#{class_index['index']}"))
        end
        result
    end

    def self.equipment
        result = []
        equipment = HTTParty.get("#{BASE_URL}equipment/")
        equipment['results'].each do |p|
            result << p
        end
        result
    end

    def self.proficencies
        result = []
        proficiencies = HTTParty.get("#{BASE_URL}proficiencies/")
        proficiencies['results'].each do |p|
            result.append(p)
        end
        result
    end
end