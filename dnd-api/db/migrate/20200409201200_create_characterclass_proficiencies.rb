class CreateCharacterclassProficiencies < ActiveRecord::Migration[6.0]
  def change
    create_table :characterclass_proficiencies do |t|
      t.references :proficiency, null: false, foreign_key: true
      t.references :characterclass, null: false, foreign_key: true

      t.timestamps
    end
  end
end
