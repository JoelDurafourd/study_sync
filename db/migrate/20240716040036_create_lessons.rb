class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.string :category
      t.text :description
      t.string :title
      t.float :price
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
