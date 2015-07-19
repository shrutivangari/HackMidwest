class RenameColumnName < ActiveRecord::Migration
  def change
    rename_column :chemical_compound_foods, :chemical_compounds, :name
  end
end
