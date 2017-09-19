ActiveRecord::Schema.define(version: 20170825142037) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "classname"
    t.integer "edition"
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
