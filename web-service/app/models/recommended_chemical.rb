class RecommendedChemical < ActiveRecord::Base
  belongs_to :disease
  belongs_to :chemical_compound
end
