class CreateCharacterclasses < ActiveRecord::Migration[6.0]
  def change
    create_table :characterclasses do |t|
      t.string :index
      t.integer :hit_die
      
      t.timestamps
    end
  end
end
