class Proficiency < ApplicationRecord
    has_many :characterclass_proficiencies
    has_many :characterclasses, through: :characterclass_proficencies
    
    validates :index, uniqueness: true
end
