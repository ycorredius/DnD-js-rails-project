class Character < ApplicationRecord
    belongs_to :characterclass
    belongs_to :race
    has_many :proficiencies, through: :characterclass
    has_many :equipments, through: :characterclass

end
