class Food < ActiveRecord::Base
  has_many :food_nutrients
  has_many :nutrients, through: :food_nutrients
end
