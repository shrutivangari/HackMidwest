class RenameRecommendationChemicals < ActiveRecord::Migration
  def self.up
    rename_table :recommendation_chemicals , :recommended_chemicals
  end
  def self.down
    rename_table :recommended_chemicals , :recommendation_chemicals
  end
end
