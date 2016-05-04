class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.integer :genre_id
      t.decimal :price
      t.integer :inventory, default: 1

      t.timestamps null: false
    end
    add_index :books, :author_id
    add_index :books, :genre_id
  end
end
