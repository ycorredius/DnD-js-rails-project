class DndApi
    BASE_URL = "http://dnd5eapi.co/api/"
    

    def self.classes
        result = []
        classes = HTTParty.get("#{BASE_URL}classes")
        classes['results'].each do |class_index|
            class_by_name = HTTParty.get("#{BASE_URL}classes/#{class_index['index']}")
            result << class_by_name
        end
    end

    def self.equipment
        result = []
        equipment = HTTParty.get("#{BASE_URL}equipment/")
        equipment['results'].each do |equipment_index|
            equipment_by_index = HTTParty.get("#{BASE_URL}equipment/#{equipment_index['index']}")
            result << equipment_by_index
        end
    end

end