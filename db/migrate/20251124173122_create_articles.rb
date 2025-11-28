class CreateArticles < ActiveRecord::Migration[8.1]
  def change
    create_table :articles do |t|
      t.references :release, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.text :title, null: false
      t.text :photo
      t.text :preview
      t.text :body
      t.text :audio
      t.date :published_at

      t.timestamps
    end
  end
end
