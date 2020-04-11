class ProficiencySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :category 
  has_many :characterclass_proficiencies
end
