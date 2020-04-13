class CharacterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :characterclass
end
