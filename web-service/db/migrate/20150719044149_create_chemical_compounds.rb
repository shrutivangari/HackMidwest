class CreateChemicalCompounds < ActiveRecord::Migration
  def change
    create_table :chemical_compounds do |t|
      t.string :name
      t.references :nutrient, index: true

      t.timestamps null: false
    end
    add_foreign_key :chemical_compounds, :nutrients
  end
end
