class RenameTableChemicalCompoundNutrient < ActiveRecord::Migration
  def self.up
    rename_table :table_chemical_compound_nutrients , :chemical_compound_nutrients
  end
  def self.down
    rename_table :chemical_compound_nutrients , :table_chemical_compound_nutrients
  end
end
