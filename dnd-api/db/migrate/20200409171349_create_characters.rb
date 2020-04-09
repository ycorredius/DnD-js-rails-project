class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|

      t.timestamps
    end
  end
end
