class Characterclass < ApplicationRecord
    has_many :characters
    has_many :characterclass_proficiencies
    has_many :characterclass_equipments
    has_many :proficiencies, through: :characterclass_proficiencies
    has_many :equipment, through: :characterclass_equipments

    validates :name, uniqueness: true
end
