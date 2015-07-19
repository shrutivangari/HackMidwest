class CreateChemicalCompoundNutrient < ActiveRecord::Migration
  def change
    create_table :chemical_compound_nutrients do |t|
      t.references :nutrient, index: true
      t.references :chemical_compound, index: true
    end
    add_foreign_key :chemical_compound_nutrients, :nutrients
    add_foreign_key :chemical_compound_nutrients, :chemical_compounds
  end
end
