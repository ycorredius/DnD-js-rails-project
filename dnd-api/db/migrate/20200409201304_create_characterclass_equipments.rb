class CreateCharacterclassEquipments < ActiveRecord::Migration[6.0]
  def change
    create_table :characterclass_equipments do |t|
      t.references :equipment, null: false, foreign_key: true
      t.references :characterclass, null: false, foreign_key: true

      t.timestamps
    end
  end
end
