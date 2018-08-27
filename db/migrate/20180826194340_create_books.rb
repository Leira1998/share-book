class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :classname
      t.integer :edition
      t.string :document
      t.timestamps
    end
  end
end
