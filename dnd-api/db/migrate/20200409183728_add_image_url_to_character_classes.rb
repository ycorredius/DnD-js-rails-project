class AddImageUrlToCharacterClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :characterclasses, :img_url, :string
  end
end
