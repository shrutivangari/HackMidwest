class AddChemicalIdToRecommendedChemicals < ActiveRecord::Migration
  def change
    add_reference :recommended_chemicals, :chemical_compound, index: true
    add_foreign_key :recommended_chemicals, :chemical_compounds
  end
end
