class User < ActiveRecord::Base
  has_many :user_diseases
  has_many :diseases, through: :user_diseases
  validates_uniqueness_of :user_name
end
