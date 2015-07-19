class CreateTableChemicalCompoundNutrient < ActiveRecord::Migration
  def change
    create_table :table_chemical_compound_nutrients do |t|
      t.references :nutrient, index: true
      t.string :chemical_compounds
    end
    add_foreign_key :table_chemical_compound_nutrients, :nutrients
  end
end
