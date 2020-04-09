class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :phrase
      t.string :img_url
      
      t.timestamps
    end
  end
end
