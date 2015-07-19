class Nutrient < ActiveRecord::Base
  has_many :food_nutrients
  has_many :foods, through: :food_nutrients
  validates_uniqueness_of :name
end
