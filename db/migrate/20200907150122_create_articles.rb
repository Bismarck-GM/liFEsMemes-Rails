class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.string :image, null: false
      t.references :author, null: false, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
