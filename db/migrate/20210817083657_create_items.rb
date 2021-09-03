class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.string :introduction
      t.integer :price
      t.integer :is_active, default: 0

      t.timestamps
    end
  end
end


