class AddMinToRecommendedRanges < ActiveRecord::Migration
  def change
    add_column :recommended_ranges, :min, :integer
    add_column :recommended_ranges, :max, :integer
  end
end
