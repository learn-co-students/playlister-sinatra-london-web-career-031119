class CreateArtistsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |i|
      i.string :name
    end
  end
end
