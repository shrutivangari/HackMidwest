class RemoveChemicalCompoundsFromRecommendedChemicals < ActiveRecord::Migration
  def change
    remove_column :recommended_chemicals, :chemical_compounds, :string
  end
end
