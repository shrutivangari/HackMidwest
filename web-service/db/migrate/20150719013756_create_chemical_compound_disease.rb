class CreateChemicalCompoundDisease < ActiveRecord::Migration
  def change
    create_table :chemical_compound_diseases do |t|
      t.references :disease, index: true
      t.string :chemical_compounds
    end
    add_foreign_key :chemical_compound_diseases, :diseases
  end
end
