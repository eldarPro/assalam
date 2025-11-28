class CreateSubscriptions < ActiveRecord::Migration[8.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tariff, null: false, foreign_key: true

      t.date :paymented_at, null: false
      t.integer :payment_type
      t.string :memo

      t.timestamps
    end
  end
end
