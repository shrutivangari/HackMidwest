class RenameFoodNutritions < ActiveRecord::Migration
  def self.up
      rename_table :food_nutritions, :food_nutrients
  end
  def self.down
      rename_table :food_nutrients, :food_nutritions 
  end
end
