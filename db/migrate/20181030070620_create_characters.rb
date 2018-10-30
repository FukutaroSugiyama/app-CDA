class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string "character"
      t.decimal "character_distance", precision: 12, scale: 3
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
