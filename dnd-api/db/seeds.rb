# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DndApi.equipment.each do |item|
    equip = Equipment.create(index: item['index'], name:item['name'], url: item['url'])
end

DndApi.proficencies.each do |proficency|
    Proficiency.create(index: proficency['index'], name: proficency['name'], url: proficency['url'])
end

DndApi.classes.each do |c|
    Characterclass.create(index: c['index'], hit_die: c['hit_die']) 
end
