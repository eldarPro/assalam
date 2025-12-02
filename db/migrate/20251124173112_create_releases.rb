class CreateReleases < ActiveRecord::Migration[8.1]
  def change
    create_table :releases do |t|
      t.integer :year_number, null: false
      t.integer :general_number, null: false
      t.string :hidjra_date, null: false
      t.string :photo, null: false
      t.string :pdf, null: false
      t.string :r_date
      t.integer :circulation, null: false
      t.date :published_at, null: false

      t.timestamps
    end
  end
end
