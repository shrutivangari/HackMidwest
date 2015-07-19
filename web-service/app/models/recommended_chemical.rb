class RecommendedChemical < ActiveRecord::Base
  has_many :disease
  has_many :chemical_compound
end
