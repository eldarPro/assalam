class CreateNews < ActiveRecord::Migration[8.1]
  def change
    create_table :news do |t|
      t.date :event_date
      t.string :path
      t.string :photo, null: false
      t.string :title, null: false
      t.string :description
      t.string :keys
      t.text :body, null: false
      t.string :original
      t.integer :author_id
      t.date :published_at

      t.timestamps
    end
  end
end
