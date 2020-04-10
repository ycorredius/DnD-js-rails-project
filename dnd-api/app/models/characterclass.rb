class Characterclass < ApplicationRecord
    has_many :characters
    has_many :characterclass_proficiencies
    has_many :proficiencies , through: :characterclass_proficiencies

    validates :index, uniqueness: true
end
