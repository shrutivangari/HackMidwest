class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.datetime :date_of_birth
      t.integer :gender

      t.timestamps null: false
    end
  end
end
