class Proficiency < ApplicationRecord
    has_many :characterclass_proficiencies
    has_many :characterclasses, through: :characterclass_proficiencies
    
    validates :index, uniqueness: true

end
