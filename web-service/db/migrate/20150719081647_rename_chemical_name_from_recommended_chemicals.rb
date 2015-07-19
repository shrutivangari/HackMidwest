class RenameChemicalNameFromRecommendedChemicals < ActiveRecord::Migration
  def change
    rename_column :recommended_chemicals, :chemical_name, :chemical_compound_id
  end
end
