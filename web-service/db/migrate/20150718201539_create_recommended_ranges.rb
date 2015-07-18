class CreateRecommendedRanges < ActiveRecord::Migration
  def change
    create_table :recommended_ranges do |t|

      t.timestamps null: false
    end
  end
end
