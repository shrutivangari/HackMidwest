class AddChemicalIdToChemicalCompoundFoods < ActiveRecord::Migration
  def change
    add_reference :chemical_compound_foods, :chemical_compound, index: true
    add_foreign_key :chemical_compound_foods, :chemical_compounds
  end
end
