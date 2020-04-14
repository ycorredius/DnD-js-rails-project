class CharacterclassSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :hit_die, :img_url, :proficiencies, :characters
  has_many :characters
  has_many :characterclass_proficiencies
  has_many :proficiencies, through: :character_proficiencies
end
