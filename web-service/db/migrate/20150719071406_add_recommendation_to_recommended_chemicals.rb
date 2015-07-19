class AddRecommendationToRecommendedChemicals < ActiveRecord::Migration
  def change
    add_column :recommended_chemicals, :recommended, :boolean
  end
end
