# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DndApi.equipment.each do |item|
    equip = Equipment.create(name: item['index'], url: item['url'])
end

DndApi.classes.each do |c|
    Characterclass.create(name: c['name'].downcase, hit_die: c['hit_die']) 
end

DndApi.proficencies.each do |proficency|
    new_proficency = Proficiency.new(name: proficency['name'], category: proficency['type'])
    if !proficency['classes'].empty?
        proficency['classes'].each do |p|
            characterclass = Characterclass.find_by(name:p['name'].downcase)
            if characterclass
                new_proficency.characterclass_proficiencies.build(characterclass_id:characterclass.id) 
                new_proficency.save
            end
        end
    end
end

DndApi.races.each do |race|
    Race.create(name: race['name'],speed: race['speed'],age:race['age'],alignment:race['alignment'],size_description:race['size_description'],language_desc:race['language_desc'])
end


barbarian = Characterclass.find_by(name: "barbarian")
barbarian.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/342/420/618/636272680339895080.png"
barbarian.save
bard = Characterclass.find_by(name: "bard")
bard.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/369/420/618/636272705936709430.png"
bard.save
cleric = Characterclass.find_by(name: "cleric")
cleric.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/371/420/618/636272706155064423.png"
cleric.save
druid = Characterclass.find_by(name: "druid")
druid.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/346/420/618/636272691461725405.png"
druid.save
fighter = Characterclass.find_by(name: "fighter")
fighter.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/359/420/618/636272697874197438.png"
fighter.save
monk = Characterclass.find_by(name: "monk")
monk.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/489/420/618/636274646181411106.png"
monk.save
paladin = Characterclass.find_by(name: "paladin")
paladin.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/365/420/618/636272701937419552.png"
paladin.save
ranger = Characterclass.find_by(name: "ranger")
ranger.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/367/420/618/636272702826438096.png"
ranger.save
rogue = Characterclass.find_by(name: "rogue")
rogue.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/384/420/618/636272820319276620.png"
rogue.save
sorcerer = Characterclass.find_by(name: "sorcerer")
sorcerer.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/485/420/618/636274643818663058.png"
sorcerer.save
warlock = Characterclass.find_by(name: "warlock")
warlock.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/375/420/618/636272708661726603.png"
warlock.save
wizard = Characterclass.find_by(name: "wizard")
wizard.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/357/420/618/636272696881281556.png"
wizard.save