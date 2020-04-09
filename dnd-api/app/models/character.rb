class Character < ApplicationRecord
    belongs_to :characterclass
    has_many :proficiencies, through: :characterclass
    has_many :equipments, through: :characterclass

    validates :name, uniqueness: true
end
