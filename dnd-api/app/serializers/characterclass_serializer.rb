class CharacterclassSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :hit_die, :img_url, :proficiencies
  has_many :characterclass_proficiencies
  has_many :proficiencies, through: :characterclass_proficiencies
end
