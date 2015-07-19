class ChemicalCompoundFood < ActiveRecord::Base
  belongs_to :food
  belongs_to :chemical_compound
end
