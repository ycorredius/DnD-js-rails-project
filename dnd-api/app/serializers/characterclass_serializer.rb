class CharacterclassSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :hit_die, :img_url, :proficiencies, :characters
  has_many :characters
end
