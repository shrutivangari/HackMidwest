class ChemicalCompound < ActiveRecord::Base
  belongs_to :nutrient
  validates_uniqueness_of :name
end
