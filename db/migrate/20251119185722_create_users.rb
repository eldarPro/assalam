class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    execute <<-SQL
      CREATE TYPE gender AS ENUM ('male', 'female');
    SQL

    create_table :users do |t|
      t.string :fio
      t.string :email
      t.column :gender, :gender, null: true
      t.string :phone
      t.string :password_digest, null: false

      t.timestamps
    end
    add_index :users, :phone, unique: true
  end
end
