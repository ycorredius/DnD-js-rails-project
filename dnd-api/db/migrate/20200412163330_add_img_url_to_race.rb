class AddImgUrlToRace < ActiveRecord::Migration[6.0]
  def change
    add_column :races, :img_url, :string
  end
end
