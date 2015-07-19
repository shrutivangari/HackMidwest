class DeleteNutrientIdFromChemicalCompounds < ActiveRecord::Migration
  def change
    remove_column :chemical_compounds, :nutrient_id, :integer
  end
end
