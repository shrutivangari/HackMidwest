class Food < ActiveRecord::Base
  has_many :food_nutrients
  has_many :nutrients, through: :food_nutrients
  validates_uniqueness_of :name
end
