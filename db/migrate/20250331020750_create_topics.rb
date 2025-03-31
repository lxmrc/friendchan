class CreateTopics < ActiveRecord::Migration[8.0]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.text :content
      t.string :image_path
      t.timestamps
    end
  end
end
