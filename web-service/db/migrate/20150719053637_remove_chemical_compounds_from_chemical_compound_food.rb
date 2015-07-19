class RemoveChemicalCompoundsFromChemicalCompoundFood < ActiveRecord::Migration
  def change
    remove_column :chemical_compound_foods, :name, :string
  end
end
