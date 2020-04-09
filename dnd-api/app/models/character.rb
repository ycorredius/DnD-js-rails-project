class Character < ApplicationRecord
    belongs_to :characterclass
    has_many :proficiencies, through: :characterclass
end
