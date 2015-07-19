class CreateChemicalCompoundFood < ActiveRecord::Migration
  def change
    create_table :chemical_compound_foods do |t|
      t.references :food, index: true
      t.string :chemical_compounds
    end
    add_foreign_key :chemical_compound_foods, :foods
  end
end
