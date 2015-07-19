class ChemicalCompoundFood < ActiveRecord::Base
  has_many :food
  has_many :chemical_compound
end
