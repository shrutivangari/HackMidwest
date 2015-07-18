class CreateFoodNutritions < ActiveRecord::Migration
  def change
    create_table :food_nutritions do |t|

      t.timestamps null: false
    end
  end
end
