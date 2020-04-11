class CharacterclassProficiencySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :proficiency_id, :characterclass_id
  belongs_to :proficiency
  belongs_to :characterclass
end
