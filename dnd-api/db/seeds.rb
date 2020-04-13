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
    Characterclass.create(name: c['name'], hit_die: c['hit_die']) 
end

DndApi.proficencies.each do |proficency|
    new_proficency = Proficiency.new(name: proficency['name'], category: proficency['type'])
    if !proficency['classes'].empty?
        proficency['classes'].each do |p|
            characterclass = Characterclass.find_by(name:p['name'])
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


barbarian = Characterclass.find_by(name: "Barbarian")
barbarian.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/342/420/618/636272680339895080.png"
barbarian.save
bard = Characterclass.find_by(name: "Bard")
bard.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/369/420/618/636272705936709430.png"
bard.save
cleric = Characterclass.find_by(name: "Cleric")
cleric.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/371/420/618/636272706155064423.png"
cleric.save
druid = Characterclass.find_by(name: "Druid")
druid.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/346/420/618/636272691461725405.png"
druid.save
fighter = Characterclass.find_by(name: "Fighter")
fighter.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/359/420/618/636272697874197438.png"
fighter.save
monk = Characterclass.find_by(name: "Monk")
monk.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/489/420/618/636274646181411106.png"
monk.save
paladin = Characterclass.find_by(name: "Paladin")
paladin.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/365/420/618/636272701937419552.png"
paladin.save
ranger = Characterclass.find_by(name: "Ranger")
ranger.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/367/420/618/636272702826438096.png"
ranger.save
rogue = Characterclass.find_by(name: "Rogue")
rogue.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/384/420/618/636272820319276620.png"
rogue.save
sorcerer = Characterclass.find_by(name: "Sorcerer")
sorcerer.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/485/420/618/636274643818663058.png"
sorcerer.save
warlock = Characterclass.find_by(name: "Warlock")
warlock.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/375/420/618/636272708661726603.png"
warlock.save
wizard = Characterclass.find_by(name: "Wizard")
wizard.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/357/420/618/636272696881281556.png"
wizard.save

dragongborn = Race.find_by(name: "Dragonborn")
dragongborn.img_url ="https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/340/420/618/636272677995471928.png"
dragongborn.save
dwarf = Race.find_by(name: "Dwarf")
dwarf.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/254/420/618/636271781394265550.png"
dwarf.save
elf = Race.find_by(name: "Elf")
elf.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/7/639/420/618/636287075350739045.png"
elf.save
gnome= Race.find_by(name: "Gnome")
gnome.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/334/420/618/636272671553055253.png"
gnome.save
half_elf= Race.find_by(name: "Half-Elf")
half_elf.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/481/420/618/636274618102950794.png"
half_elf.save
half_orc= Race.find_by(name: "Half-Orc")
half_orc.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/466/420/618/636274570630462055.png"
half_orc.save
halfling= Race.find_by(name: "Halfling")
halfling.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/256/420/618/636271789409776659.png"
halfling.save
human= Race.find_by(name: "Human")
human.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/6/258/420/618/636271801914013762.png"
human.save
tiefling= Race.find_by(name: "Tiefling")
tiefling.img_url = "https://media-waterdeep.cursecdn.com/avatars/thumbnails/7/641/420/618/636287076637981942.png"
tiefling.save
