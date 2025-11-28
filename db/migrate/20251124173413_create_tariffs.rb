class CreateTariffs < ActiveRecord::Migration[8.1]
  def change
    create_table :tariffs do |t|
      t.string :title, null: false
      t.integer :days, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
