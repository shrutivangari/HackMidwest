class AddAssociationsToFoodNutrients < ActiveRecord::Migration
  def change
    add_reference :food_nutrients, :food, index: true
    add_foreign_key :food_nutrients, :foods
    add_reference :food_nutrients, :nutrient, index: true
    add_foreign_key :food_nutrients , :nutrients

    add_column :food_nutrients, :value, :integer
    add_column :food_nutrients, :unit, :string
  end
end
