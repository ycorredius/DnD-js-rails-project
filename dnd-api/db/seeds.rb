# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DndApi.equipment.each do |item|
    equip = Equipment.create(index: item['index', name:ite['name'], url:item['url'])
end

DndApi.proficencies.each do |proficency|
    Proficency.create(ind)
end
# DndApi.classes.each do |class|
#     Characterclass.create 
# end
