class UserDisease < ActiveRecord::Base
  belongs_to :user
  belongs_to :disease
end
