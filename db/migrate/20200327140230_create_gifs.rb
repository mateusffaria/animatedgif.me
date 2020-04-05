class CreateGifs < ActiveRecord::Migration[5.2]
  def change
    create_table :gifs do |t|
      t.belongs_to :user, foreign_key: true
      t.text :image_data

      t.timestamps
    end
  end
end
