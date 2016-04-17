class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :sinopsis
      t.string :body
      t.string :title
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
