class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :body
      t.attachment :image

      t.timestamps
    end
  end
end
