class CreateGenresTable < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |i|
      i.string :name
    end
  end
end
