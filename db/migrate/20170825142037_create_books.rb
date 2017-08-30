class CreateBooks < ActiveRecord::Migration[5.1]
  def up
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :classname
      t.integer :edition
      t.attachment :document
      t.timestamps
    end
  end
  def down
    drop_table :books
  end
end
