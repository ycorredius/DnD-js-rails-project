class CreateProficiencies < ActiveRecord::Migration[6.0]
  def change
    create_table :proficiencies do |t|
      t.string :name
      t.string :category
      
      t.timestamps
    end
  end
end
