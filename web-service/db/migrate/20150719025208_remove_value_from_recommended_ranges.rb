class RemoveValueFromRecommendedRanges < ActiveRecord::Migration
  def change
    remove_column :recommended_ranges, :value, :integer
  end
end
