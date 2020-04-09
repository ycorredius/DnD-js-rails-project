class CreateProficiencies < ActiveRecord::Migration[6.0]
  def change
    create_table :proficiencies do |t|
      t.string :index
      t.string :category
      
      t.timestamps
    end
  end
end
