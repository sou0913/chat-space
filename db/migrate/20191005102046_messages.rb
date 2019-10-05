class Messages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text     "body",       limit: 65535
      t.string   "image"
      t.integer  "group_id"
      t.integer  "user_id"
      t.datetime "created_at",               null: false
      t.datetime "updated_at",               null: false
      t.index ["group_id"], name: "index_messages_on_group_id", using: :btree
      t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
    end
  end
end
