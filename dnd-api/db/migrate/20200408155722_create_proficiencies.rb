class CreateProficiencies < ActiveRecord::Migration[6.0]
  def change
    create_table :proficiencies do |t|
      t.string :name
      t.string :index
      t.string :url
      
      t.timestamps
    end
  end
end