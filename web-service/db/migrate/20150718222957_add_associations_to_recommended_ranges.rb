class AddAssociationsToRecommendedRanges < ActiveRecord::Migration
  def change
    add_reference :recommended_ranges, :disease, index: true
    add_foreign_key :recommended_ranges, :diseases
    add_reference :recommended_ranges, :nutrient, index: true
    add_foreign_key :recommended_ranges, :nutrients

    add_column :recommended_ranges, :value, :integer
    add_column :recommended_ranges, :units, :string
  end
end
