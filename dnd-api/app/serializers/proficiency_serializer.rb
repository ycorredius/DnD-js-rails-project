class ProficiencySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :category 
  has_many :characterclass_proficiencies
  has_many :characters, through: :characterclass_proficiencies
end
