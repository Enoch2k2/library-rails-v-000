class CreateCartBooks < ActiveRecord::Migration
  def change
    create_table :cart_books do |t|
      t.integer :cart_id
      t.integer :book_id
      t.integer :quantity, default: 1

      t.timestamps null: false
    end
    add_index :cart_books, :cart_id
    add_index :cart_books, :book_id
  end
end
