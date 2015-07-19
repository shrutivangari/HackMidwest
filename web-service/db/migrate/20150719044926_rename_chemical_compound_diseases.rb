class RenameChemicalCompoundDiseases < ActiveRecord::Migration
  def self.up
    rename_table :chemical_compound_diseases , :recommendation_chemicals
  end
  def self.down
    rename_table :recommendation_chemicals , :chemical_compound_diseases
  end
end
