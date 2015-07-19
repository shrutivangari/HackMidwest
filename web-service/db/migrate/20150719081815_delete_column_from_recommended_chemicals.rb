class DeleteColumnFromRecommendedChemicals < ActiveRecord::Migration
  def change
    remove_column :recommended_chemicals, :chemical_compound_id, :string
  end
end
