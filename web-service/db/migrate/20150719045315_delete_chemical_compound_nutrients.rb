class DeleteChemicalCompoundNutrients < ActiveRecord::Migration
  def up
    drop_table :chemical_compound_nutrients
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
