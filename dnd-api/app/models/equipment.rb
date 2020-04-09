class Equipment < ApplicationRecord
    has_many :characterclass_equipments
    has_many :equipment, through: :character_equipments
    
    validates :index, uniqueness: true
end
