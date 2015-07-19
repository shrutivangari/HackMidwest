class ChemicalCompoundNutrient < ActiveRecord::Base
  has_many :nutrient
  has_many :chemical_compound
end
