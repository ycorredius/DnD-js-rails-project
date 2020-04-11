class CharacterclassEquipmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :characterclass_id, :equipment_id
  belongs_to :characterclass 
  belongs_to :equipment
end
