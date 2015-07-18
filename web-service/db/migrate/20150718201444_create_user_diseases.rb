class CreateUserDiseases < ActiveRecord::Migration
  def change
    create_table :user_diseases do |t|

      t.timestamps null: false
    end
  end
end
