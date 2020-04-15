class AddRaceReferenceToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :race, foreign_key: true
  end
end
