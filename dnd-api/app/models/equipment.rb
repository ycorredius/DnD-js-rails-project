class Equipment < ApplicationRecord
    has_many :characterclass_equipments
    has_many :characterclasses, through: :characterclass_equipments
    
    validates :name, uniqueness: true
end
