class CharacterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :characterclass, :race
  belongs_to :characterclass
  belongs_to :race
end
