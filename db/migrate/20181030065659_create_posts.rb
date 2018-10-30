class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text "content"
      t.decimal "content_distance", precision: 12, scale: 3
      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
