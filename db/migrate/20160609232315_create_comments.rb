class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :post_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :comments, :posts
    add_index :comments, :post_id
  end
end
