class AddRecommendedToRecommendedRanges < ActiveRecord::Migration
  def change
    add_column :recommended_ranges, :recommended, :boolean
  end
end
