class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :speed
      t.string :age
      t.string :alignment
      t.string :size_description
      t.string :language_desc

      t.timestamps
    end
  end
end
